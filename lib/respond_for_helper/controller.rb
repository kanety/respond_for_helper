# frozen_string_literal: true

module RespondForHelper
  module Controller
    extend ActiveSupport::Concern

    def respond_for(item, options = {})
      klass = Config.formats[request.format.to_sym] || Config.formats[:html]
      formatter = klass.new(self, item, options)
      formatter.call
      yield if block_given? && formatter.succeeded?
    end

    def respond_for_message(type, options = {})
      options = options.reverse_merge(controller_path: controller_path, action_name: action_name)
      Config.flash.new(type, options).call
    end

    included do
      class_attribute :respond_for_behaviours
    end
  end
end
