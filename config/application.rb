#require 'devise/orm/:active_record'
require 'kaminari'
require_relative 'boot'
require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GeniusLounge
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.


    #config.load_defaults 5.1
    #config.middleware.use Rack::MethodOverride
    config.app_generators.scaffold_controller :responders_controller
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.use ActionDispatch::Session::CookieStore
    config.exceptions_app = self.routes
    config.eager_load_paths = Dir.glob("#{Rails.root}/app/*").reject do |path|
      path.include?("admin_user")
    end

  end
end
