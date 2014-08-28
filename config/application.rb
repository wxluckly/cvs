require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Cvs
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.assets.precompile += %w(origin/css_pbm0l.css origin/css_pgxGU.css origin/css_JD5d6-.css origin/css_UBtNMO.css origin/css_yvjdhf.css new.css reset.css app_bootstrap.css bootstrap-ie6.css ie.css)
    config.assets.precompile += %w(origin/respond.js origin/js_xAPl0q.js origin/js_n7Lw7P.js origin/js_KAh8fA.js origin/js_b3i2Om.js origin/html5.js origin/js_Dpwj9_.js)

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
