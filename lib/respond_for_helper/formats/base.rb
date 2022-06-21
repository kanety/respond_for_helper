# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Base
      class_attribute :format

      attr_reader :controller, :item, :format, :result, :behaviour
      delegate :request, :render, :head, :redirect_to, :flash, :url_for, :action_name, to: :controller

      def initialize(controller, item, options)
        @controller = controller
        @item = item
        @options = options

        @format = self.class.format.to_sym
        @result = @options[:success] ? :success : :failure
        @behaviour = Behaviours.new(@controller, @format, @result, @options).call
      end

      def call
        if respond_to?("_#{action_name}", true)
          send("_#{action_name}")
        else
          perform
        end
      end

      private

      def perform
      end

      def succeeded?
        @result == :success
      end

      def resolve_target(target)
        if target.respond_to?(:call)
          @controller.instance_exec(&target)
        elsif target.is_a?(Symbol)
          if respond_to?(target)
            send(target)
          elsif @behaviour.redirect?
            resolve_url(target)
          else
            target
          end
        else
          target
        end
      end

      def resolve_url(target)
        url_for(action: target)
      rescue ActionController::UrlGenerationError
        url_for(action: target, id: @item)
      end
    end
  end
end
