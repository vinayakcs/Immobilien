module SessionsHelper
  include GlobalConstants
  def sign_in(user)

    remember_token = user.get_remember_token
    cookies.permanent.signed[:remember_token] = remember_token
    cookies.signed[:type]=user.class.name
    user.update_attribute(:remember_token, remember_token)
    self.current_user = user
  end

  def set_signup_token(omniauth_authentication)
   signup_token=omniauth_authentication.get_rand_token(OmniauthAuthentication,"signup_token")
   cookies.signed[:signup_token] = signup_token
   omniauth_authentication.update_attribute(:signup_token,signup_token)
  end

  def get_signup_omniauth
   @omniauth_authentication ||= OmniauthAuthentication.find_by(signup_token: cookies.signed[:signup_token]) if cookies[:signup_token]
  end

  def current_user_type
   self.current_user.class.name
  end

  def current_user=(user)
   @current_user = user
  end

  def current_user
   #@current_user=Agent.find(1) 
   if GlobalConstants::USER_TYPE.include? cookies.signed[:type].to_s
    @current_user ||= Object.const_get(cookies.signed[:type]).where(remember_token: cookies.signed[:remember_token]).first if cookies[:remember_token]
   elsif !cookies.signed[:type].blank?
    Rails.logger.error {"current_user improper cookie #{cookies.signed[:type]} "}
    raise "ERROR"
   end
  end


#use id instead of object, some cases only id might be available
  def current_user?(user_id)
     check_auth_user? && self.current_user.id==user_id
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end


#all before_filter must have this, where content mutation/creation is intended
  def redirect_for_guest_user(type)

   if !check_auth_user?
    flash[:danger] = "Please Login, to continue"
    redirect_to root_path
   elsif type!=nil and current_user_type!=type 
    flash[:danger] = "You don't have access!"
    redirect_to root_path   
   end
  end 



  def check_auth_user?
   #return true 
   if self.current_user.nil? || self.current_user.remember_token.nil? || self.current_user.remember_token!=cookies.signed[:remember_token]
    return false
   else
    return true
   end
  end

end
