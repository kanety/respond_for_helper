# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Json < Base
      self.format = :json

      def item_errors
        @item.errors
      end

      private

      def perform
        if @behaviour.render?
          perform_render
        elsif @behaviour.head?
          perform_head
        end
      end

      def perform_render
        render @behaviour.options.merge(json: resolve_target(@behaviour.target))
      end

      def perform_head
        head resolve_target(@behaviour.target), @behaviour.options
      end
    end
  end
end
