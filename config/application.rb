require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Edlinker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoloader = :classic

    config.assets.enabled = true
    config.assets.initialize_on_precompile = false
    config.assets.precompile += %w[active_admin.css active_admin/print.css active_admin.js]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    #config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
  end
end
