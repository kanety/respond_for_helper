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
      end

      def call
        if respond_to?("_#{action_name}", true)
          send("_#{action_name}")
        else
          default_action
        end
      end

      def succeeded?
        if @options.key?(:success)
          @options[:success]
        else
          Array(@item).all? { |item| item.errors.blank? }
        end
      end

      def default_action
      end
    end
  end
end
