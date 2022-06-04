# frozen_string_literal: true

module RespondForHelper
  module Controller
    extend ActiveSupport::Concern

    def respond_for(item, options = {})
      respond_to do |f|
        Lookup.new(self, options).call.each do |format, klass|
          f.send(format) do
            formatter = klass.new(self, item, options)
            formatter.call
            yield if block_given? && formatter.success?
          end
        end
      end
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
