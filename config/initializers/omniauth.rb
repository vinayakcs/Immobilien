Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.config.facebook_appid, Rails.application.config.facebook_appsecret
  provider :google_oauth2, Rails.application.config.google_clientid, Rails.application.config.google_clientsecret
end
