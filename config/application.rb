require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Artholding
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ru

    #Paperclip production
    config.paperclip_defaults = {
        storage: :s3,
        s3_credentials: {
            bucket: ENV['S3_BUCKET_NAME'],
            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
        },
        s3_protocol: "http",
        url: ":s3_domain_url",
        path: "/:class/:attachment/:id_partition/:style/:filename",
        s3_domain_url: "s3-ap-southeast-1.amazonaws.com"
    }
    # Paperclip development
    # config.paperclip_defaults = {
    #     path: "/images/:attachable_type/:project_id/:style/:filename",
    #     url: "/images/:attachable_type/:project_id/:style/:filename"
    # }

    #Mailer
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address: "smtp.gmail.com",
        port: 587,
        # domain: "artholding.ru",
        authentication: "plain",
        enable_starttls_auto: true,
        user_name: ENV["GMAIL_USERNAME"],
        password: ENV["GMAIL_PASSWORD"]
    }
    # config.action_mailer.default_url_options = {host: "www.artholding.ru"}
    # config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
    # config.action_mailer.raise_delivery_errors = true
    # config.action_mailer.perform_deliveries = true
  end
end
