require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Artfactum
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.active_record.default_timezone = :utc
    config.action_controller.action_on_unpermitted_parameters = :raise

    # Custom directories with classes and modules you want to be autoloadable.
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
