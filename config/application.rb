require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ScBackend
  class Application < Rails::Application
    #add api only to reduce the size of the ruby project.
    config.api_only = true
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.to_prepare do
      DeviseController.respond_to :html, :json
    end

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end



    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
