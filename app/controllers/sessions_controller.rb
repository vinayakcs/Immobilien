class SessionsController < ApplicationController
  include GlobalConstants
  include SessionsHelper
  include ApplicationHelper



  def omniauth_signup
   @omniauth_authentication=get_signup_omniauth
   if !@omniauth_authentication.nil? and !params[:user].blank?
    if params[:user]=="Client"
     @user=Client.new
    elsif params[:user]=="Manager"
     @user=Agent.new
    else
     Rails.logger.error {"omniauth_signup fails gets inapproriate user #{params} "}
     redirect_to root_path, notice: "Signup fails , Select either Manager or Client"
     return
    end
    populate_user_from_omniauth_on_signup
    if @user.save
     sign_in(@user)
     user_type=current_user_type
     if user_type==GlobalConstants::USER_AGENT
	     redirect_to edit_agent_path(@user), notice: "Successfully signed up, complete your profile."
       return
     elsif user_type==GlobalConstants::USER_CLIENT
	     redirect_to edit_client_path(@user), notice: "Successfully signed up, complete your profile."
       return
     else
        Rails.logger.error {"omniauth_signup fails user_type unknown object is not saved #{@user} "}
        redirect_to root_path, notice: "Technical error , signup failed, contact Admins"
        return
     end
     
    else
     Rails.logger.error {"omniauth_signup fails user object is not saved #{@user.errors.full_messages} "}
     redirect_to root_path, notice: "Technical error , signup failed, contact Admins"
     return
    end
   elsif !@omniauth_authentication.nil? and params[:user].blank?
    Rails.logger.error {"omniauth_signup fails params is improper #{params} "}
    redirect_to root_path, notice: "Technical error , signup failed, contact Admins"
    return
   else
    Rails.logger.error {"omniauth_signup fails omniauth_authentication is null #{params} "}
    redirect_to root_path, notice: "Technical error , signup failed, contact Admins"
    return
   end 
  end

  def omniauth_create
    auth_hash = request.env['omniauth.auth']
    @omniauth_authentication = OmniauthAuthentication.find_with_omniauth(auth_hash)

    uid = auth_hash[:uid]
    provider = auth_hash[:provider]
    email = auth_hash[:info][:email]
    first_name = auth_hash[:info][:first_name]
    last_name = auth_hash[:info][:last_name]
    avatar = auth_hash[:info][:image]
    url = auth_hash[:extra][:raw_info][:link]

    gender = auth_hash[:extra][:raw_info][:gender]
    if gender != "male" and gender != "female"
      gender = "other"
    end

    if (uid.present? and provider.present? and email.present? and first_name.present? and gender.present?)
      if !check_auth_user? 
       if @omniauth_authentication 
         if !@omniauth_authentication.signupdate.nil? and !@omniauth_authentication.omniauthable.nil? #signup completed
           handle_signin(@omniauth_authentication)
         else #signup not complete
           handle_signup(@omniauth_authentication)
         end
       else #new user presignup
         register_omniauth(first_name,last_name,email,gender,uid,provider,url)
       end
      else
       already_logged_in_msg
      end
    else 
      Rails.logger.error {"omniauth_create fails #{provider},#{uid},#{url},#{first_name},#{last_name},#{email},#{gender} "}
      no_properresponse_from_social_site    
    end

  end

  def omniauth_failure
    redirect_to root_url, notice: "Unable to link due to Technical error"
  end

  def session_status

  end

  def destroy
    sign_out
    redirect_to root_url, :notice => "Good bye"
  end 

  private



  def handle_signup(omniauth_authentication)
   set_signup_token(omniauth_authentication)
   render_signup_template
  end

  def handle_signin(omniauth_authentication)
    puts "handle_signin"
    sign_in(omniauth_authentication.omniauthable)
    redirect_to root_path, notice: "Signed in!!"
    return
  end


  def register_omniauth(first_name,last_name,email,gender,uid,provider,url)
   omniauth_authentication=OmniauthAuthentication.new
   omniauth_authentication.provider=provider
   omniauth_authentication.uid=uid
   omniauth_authentication.url=url
   omniauth_authentication.first_name=first_name
   omniauth_authentication.last_name=last_name
   omniauth_authentication.email=email
   omniauth_authentication.gender=gender
   if omniauth_authentication.save
    handle_signup(omniauth_authentication)
   else
    Rails.logger.error {"register_omniauth fails #{provider},#{uid},#{url},#{first_name},#{last_name},#{email},#{gender} "}
    no_properresponse_from_social_site
   end 
  end

  def already_logged_in_msg
   redirect_to root_path, notice: "Already Logged in!"
   return
  end

  def no_properresponse_from_social_site
   redirect_to root_path, notice: "Didnt receive data from your social networking account"
   return
  end

  def populate_user_from_omniauth_on_signup
   if !@user.nil? and !@omniauth_authentication.nil?    
    @user.first_name=@omniauth_authentication.first_name
    @user.last_name=@omniauth_authentication.last_name
    @user.email=@omniauth_authentication.email
    @user.gender=@omniauth_authentication.gender
    @omniauth_authentication.signupdate=Time.now
    @user.omniauth_authentication=@omniauth_authentication
   end
  end
  def render_signup_template
    disable_nav(true,false)
    render :template => '/shared/signup'
    return
  end      

end
