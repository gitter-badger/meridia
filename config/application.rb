require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# # require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Meridia
  class Application < Rails::Application
    config.time_zone = 'Mexico City'
   	initializer 'setup_asset_pipeline', :group => :all  do |app|
		# We don't want the default of everything that isn't js or css, because it pulls too many things in
		app.config.assets.precompile.shift
	  # Explicitly register the extensions we are interested in compiling
		app.config.assets.precompile.push(Proc.new do |path|
			File.extname(path).in? [
							'.html', '.erb', '.haml',                 # Templates
							'.png',  '.gif', '.jpg', '.jpeg',         # Images
							'.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
			]
		end)
	 		end 
		
		# don't generate RSpec tests for views and helpers
    config.generators do |g|
      
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      
      
      g.view_specs false
      g.helper_specs false
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
