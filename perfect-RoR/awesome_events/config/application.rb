require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AwesomeEvents
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # タイムゾーンの設定
    config.time_zone = "Tokyo"
    # ロケール情報を変更し、ラベルとエラーメッセージが日本語になるようにする
    config.i18n.default_locale = :ja
    # active storageで使う画像処理用ツールをlibvipsに変更
    config.active_storage.variant_processor = :vips
    # Rack Middleware エラーハンドリング
    config.action_dispatch.rescue_responses.merge!(
      "NewException" => :not_found
    )
  end
end
