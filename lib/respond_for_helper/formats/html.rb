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
        key = @behaviour.flash
        flash_content[key] ||= @controller.respond_for_message(key, @options)
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
