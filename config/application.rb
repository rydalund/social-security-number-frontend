require_relative "boot"

require "rails"
require "action_controller/railtie"
require "action_view/railtie"
# require "active_record/railtie"
require "active_job/railtie"
require "action_mailer/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"  # valfritt

Bundler.require(*Rails.groups)

module SocialSecurityFrontend
  class Application < Rails::Application
    config.load_defaults 8.1

    config.autoload_lib(ignore: %w[assets tasks])
  end
end