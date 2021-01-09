require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "dotenv-rails"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ExpenseManagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => false,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => false
    end
    config.generators.system_tests = nil
    config.assets.initialize_on_precompile = false
    config.secret_key_base = ENV["SECRET_KEY_BASE"]

    def credentials
      if Rails.env.production?
        encrypted(
          "config/credentials.#{Rails.env}.yml.enc",
          key_path: "config/#{Rails.env}.key"
        )
      else
        encrypted(
          "config/credentials.#{Rails.env}.yml.enc",
          key_path: "config/#{Rails.env}.key"
        )
      end
    end
  end
end
