class ClientsController < ApplicationController
 include Urltokenable	
 include SessionsHelper
 before_filter -> {redirect_for_guest_user "Client"}, :except => [:show]
 def message
  @user=current_user
 end 
 def edit
  @user=current_user
 end
 def show
  @user=search_by_url_token(Client.name.classify.constantize,params)
  @reviews=nil
  if @user.nil?
  	redirect_to root_path,:notice => t('common.does_not_exist')
  end
  @reviews=Review.get_reviews(@user.id,'Client')
  @reviews=@reviews.get_pagination_data(1)    
 end 
 def update
  @user=current_user
  client_info=params[:client]
  if @user.nil?
  	redirect_to root_path,:notice => t('common.does_not_exist')
    return
  end 
  @user.first_name=client_info[:first_name]
  @user.last_name=client_info[:last_name]
  @user.phone=client_info[:phone]
  @user.address=client_info[:address]
  @user.profile_image=client_info[:profile_image]
  @user.properties=Property.find(client_info[:property_ids]||[])
  @user.languages=Language.find(client_info[:language_ids]||[])
  @user.locations=Location.where(:fullname=>params[:tokenfield].gsub(/,\s+/, ",")
.split(',')||[])
  if @user.save
    flash[:success] = "Updated Successfully"
  else
    flash[:danger]=@user.errors.full_messages
  end  
  respond_to do |format|
    format.html { redirect_to edit_client_path(@user) }
  end    
 end 

end
