# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Base
      attr_reader :controller
      delegate :request, :respond_to, :render, :head, :redirect_to, :flash, :url_for, :action_name, to: :controller

      def initialize(controller, item, options)
        @controller = controller
        @item = item
        @options = options

        @format = self.class.name.demodulize.underscore.to_sym
        @result = succeeded? ? :success : :failure
        @behaviour = Behaviours.new(@controller, @format, @result, @options).call
      end

      def call
        if respond_to?("_#{action_name}", true)
          send("_#{action_name}")
        else
          perform
        end
      end

      def success?
        @result == :success
      end

      private

      def succeeded?
        if @options.key?(:success)
          @options[:success]
        else
          Array(@item).all? { |item| item.errors.blank? }
        end
      end

      def perform
      end

      def resolve_target(target)
        if target.respond_to?(:call)
          @controller.instance_exec(&target)
        elsif target.is_a?(Symbol) && respond_to?(target)
          send(target)
        elsif target.is_a?(Symbol) && @behaviour.redirect?
          if target.in?(Config.member_actions)
            url_for(action: target, id: @item)
          else
            url_for(action: target)
          end
        else
          target
        end
      end
    end
  end
end
