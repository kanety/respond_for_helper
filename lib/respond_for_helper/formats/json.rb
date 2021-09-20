# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Json < Base
      def respond
        respond_to do |format|
          format.json { yield }
        end
      end

      def _index
        render json: @item
      end

      def _show
        render json: @item
      end

      def _create
        if succeeded?
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def _update
        if succeeded?
          render json: @item, status: :ok
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      def _destroy
        if succeeded?
          head :no_content
        else
          head :unprocessable_entity
        end
      end

      def default_action
        if succeeded?
          render json: @item, status: :ok
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
