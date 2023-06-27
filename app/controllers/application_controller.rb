class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_user_language
  private
  def default_url_options(options = {})
   { locale: I18n.locale }.merge options
  end  
  def set_user_language
   I18n.locale = params[:locale] || I18n.default_locale
   Rails.application.routes.default_url_options[:locale]= I18n.locale 
  end
end
