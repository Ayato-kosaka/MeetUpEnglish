require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MUE
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    # 表示時のタイムゾーンをJSTに設定
    config.time_zone = 'Tokyo'
    # DB保存時のタイムゾーンをJSTに設定
    config.active_record.default_timezone = :local

    # change div field_with_error to span span_with_error
    config.action_view.field_error_proc =
      Proc.new { |html_tag, instance| %Q(<span class="span_with_error">#{html_tag}</span>).html_safe }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
