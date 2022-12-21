require_relative "boot"
require File.expand_path('../boot', __FILE__)


require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Barbershop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.autoload_paths += %W(#{config.root}/lib) # componente calendario
    config.i18n.default_locale = :"pt-BR" # mudar a linguagem para pt-br
    config.time_zone = 'Brasilia' # mudar o fuso horário para Brasilia

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
