require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Nomasalo
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]

    config.load_defaults 5.1

  end
end
