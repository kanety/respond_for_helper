# frozen_string_literal: true

require 'active_support/all'

require 'respond_for_helper/formats/base'
require 'respond_for_helper/formats/html'
require 'respond_for_helper/formats/turbo_stream'
require 'respond_for_helper/formats/json'
require 'respond_for_helper/formats/any'
require 'respond_for_helper/flashes/base'
require 'respond_for_helper/flashes/timestamp'
require 'respond_for_helper/config'
require 'respond_for_helper/lookups/format'
require 'respond_for_helper/lookups/flash'
require 'respond_for_helper/behaviour'
require 'respond_for_helper/respond'
require 'respond_for_helper/controller'
require 'respond_for_helper/helper'
require 'respond_for_helper/railtie' if defined?(Rails)

module RespondForHelper
  class << self
    def configure
      yield Config
    end

    def config
      Config
    end
  end
end
