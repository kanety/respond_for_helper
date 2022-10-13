# frozen_string_literal: true

module RespondForHelper
  module Flashes
    class Timestamp < Base
      def initialize(type, options = {})
        super
        @options = options.reverse_merge(timestamp: I18n.l(now))
      end

      private

      def now
        if Time.respond_to?(:zone)
          Time.zone.now
        else
          Time.now
        end
      end
    end
  end
end
