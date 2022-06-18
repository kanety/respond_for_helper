# frozen_string_literal: true

module RespondForHelper
  module Controller
    extend ActiveSupport::Concern

    def respond_for(item, options = {})
      respond = Respond.new(self, item, options)
      respond_to do |format|
        yield(format, respond) if block_given?
        respond.formatters.each do |formatter|
          format.send(formatter.format) { formatter.call }
        end
        respond.run_before_callbacks
      end
      respond.run_after_callbacks
    end

    def respond_for_message(type, options = {})
      klass = Lookups::Flash.new(self, options).call
      options = options.reverse_merge(controller_path: controller_path, action_name: action_name)
      klass.new(type, options).call
    end

    included do
      class_attribute :respond_for_config
      self.respond_for_config = {}
    end
  end
end
