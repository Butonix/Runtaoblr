require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Freedom
  class Application < Rails::Application
    config.paperclip_defaults = {
      storage: :s3,
      s3_protocol: 'http',
      url: 's3_domain_url',
      path: 'images/:class/:id.:style.:extension',
      s3_host_name: ENV['S3-HOST'],
      s3_credentials: {
        bucket: ENV['AWS_BUCKET'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      }
    }
    config.active_record.raise_in_transactional_callbacks = true
  end
end
