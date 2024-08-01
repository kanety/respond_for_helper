# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Html < Base
      self.format = :html

      private

      def perform
        if @behaviour.flash? && !request.xhr?
          perform_flash
        end

        if @behaviour.render?
          perform_render
        elsif @behaviour.redirect?
          perform_redirect
        end
      end

      def perform_render
        render resolve_target(@behaviour.target), @behaviour.options
      end

      def perform_redirect
        redirect_to resolve_target(@behaviour.target), @behaviour.options
      end

      def perform_flash
        flash_content[@behaviour.flash] ||= flash_message
      end

      def flash_message
        if @behaviour.flash_message.is_a?(Proc)
          @controller.instance_exec(&@behaviour.flash_message)
        elsif @behaviour.flash_message.is_a?(Symbol)
          @controller.respond_for_message(@behaviour.flash_message, @options)
        elsif @behaviour.flash_message.is_a?(String)
          @behaviour.flash_message
        else
          @controller.respond_for_message(@behaviour.flash, @options)
        end
      end

      def flash_content
        if @behaviour.render?
          flash.now
        elsif @behaviour.redirect?
          flash
        end
      end
    end
  end
end
