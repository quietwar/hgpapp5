require 'omniauth-google-oauth2'

OmniAuth.config.logger = Rails.logger
  OmniAuth.logger.progname = "omniauth"
Rails.application.config.middleware.use OmniAuth::Builder do
 
  provider :google_oauth2, '542001295987-1a2tcq6vm4ndsov68svt3e1379lpetnk.apps.googleusercontent.com',
    google_client_secret: 'tDdFW_ZGEoSYyn8o5PpqScGJ',
    prompt: "consent",
    select_account: true,
    scope: 'userinfo.email',
    image_aspect_ratio: 'square',
    image_size: 50
    on_failure { |env| AuthenticationsController.action(:failure).call(env) }
  #end
end
