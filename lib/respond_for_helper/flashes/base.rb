# frozen_string_literal: true

module RespondForHelper
  module Flashes
    class Base
      def initialize(type, options = {})
        @type = type
        @options = options
      end

      def call
        I18n.t("respond_for.format", **translations.merge(message: message))
      end

      private

      def translations
        format_keys.each_with_object({}) do |key, map|
          map[key] = if @options[key]
              I18n.t("respond_for.#{key}", value: @options[key], default: '')
            else
              ''
            end
        end
      end

      def format_keys
        I18n.t("respond_for.format").scan(/\%\{(\w+)\}/).flatten.map(&:to_sym)
      end

      def message
        @options[@type] || I18n.t(i18n_path, default: i18n_extra_paths)
      end

      def i18n_path
        "respond_for.message.#{@options[:controller_path]}.#{@options[:action_name]}.#{@type}"
      end

      def i18n_extra_paths
        [ :"respond_for.message.defaults.#{@options[:action_name]}.#{@type}",
          :"respond_for.message.#{@options[:controller_path]}.default.#{@type}",
          :"respond_for.message.defaults.default.#{@type}",
          '' ]
      end
    end
  end
end
