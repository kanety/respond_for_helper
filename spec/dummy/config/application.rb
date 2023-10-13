require_relative 'boot'

require "action_controller/railtie"
require "active_record/railtie"
require "action_view/railtie"
require "active_job/railtie"

Bundler.require(*Rails.groups)
require "respond_for_helper"

module Dummy
  class Application < Rails::Application
    config.load_defaults Rails::VERSION::STRING.to_f if config.respond_to?(:load_defaults)
  end
end
