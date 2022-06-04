# frozen_string_literal: true

module RespondForHelper
  module Lookups
    class Format
      def initialize(controller, options)
        @controller = controller
        @options = options

        @controller_config = @controller.class.respond_for_config
      end

      def call
        formats = resolve_formats
        formatters = resolve_formatters
        formatters.select { |format, _| formats.include?(format) }.to_h
      end

      private

      def resolve_formats
        if @options[:formats]
          Array(@options[:formats])
        elsif @controller_config[:formats]
          Array(@controller_config[:formats])
        else
          Config.formats
        end
      end

      def resolve_formatters
        if @controller_config[:formatters]
          Array(@controller_config[:formatters])
        else
          Config.formatters
        end
      end
    end
  end
end
