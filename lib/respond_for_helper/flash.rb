# frozen_string_literal: true

module RespondForHelper
  class Flash
    def initialize(controller, type, options = {})
      @controller = controller
      @type = type
      @options = options.reverse_merge(timestamp: I18n.l(Time.now))
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
      "respond_for.message.#{@controller.controller_path}.#{@controller.action_name}.#{@type}"
    end

    def i18n_extra_paths
      [ :"respond_for.message.defaults.#{@controller.action_name}.#{@type}",
        :"respond_for.message.#{@controller.controller_path}.default.#{@type}",
        :"respond_for.message.defaults.default.#{@type}",
        '' ]
    end
  end
end
