# frozen_string_literal: true

module RespondForHelper
  module Lookups
    class Flash
      def initialize(controller, options)
        @controller = controller
        @options = options

        @controller_config = @controller.class.respond_for_config
      end

      def call
        if @controller_config[:flasher]
          @controller_config[:flasher]
        else
          Config.flasher
        end
      end
    end
  end
end
