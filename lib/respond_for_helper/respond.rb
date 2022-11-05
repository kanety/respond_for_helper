# frozen_string_literal: true

module RespondForHelper
  class Respond
    def initialize(controller, item, options)
      @controller = controller
      @item = item
      @options = options

      unless @options.key?(:success)
        if @controller.request.get?
          @options[:success] = true
        else
          @options[:success] = Array(item).all? { |item| item.errors.blank? }
        end
      end

      @callbacks = {}
    end

    def success?
      @options[:success]
    end

    def before_success(&block)
      @callbacks[:before_success] ||= []
      @callbacks[:before_success] << block
    end

    def before_failure(&block)
      @callbacks[:before_failure] ||= []
      @callbacks[:before_failure] << block
    end

    def after_success(&block)
      @callbacks[:after_success] ||= []
      @callbacks[:after_success] << block
    end

    def after_failure(&block)
      @callbacks[:after_failure] ||= []
      @callbacks[:after_failure] << block
    end

    def run_before_callbacks
      if success?
        run_callbacks_for(:before_success)
      else
        run_callbacks_for(:before_failure)
      end
    end

    def run_after_callbacks
      if success?
        run_callbacks_for(:after_success)
      else
        run_callbacks_for(:after_failure)
      end
    end

    def run_callbacks_for(name)
      if @callbacks[name]
        @callbacks[name].each do |callback|
          callback.call
        end
      end
    end

    def formatters
      Lookups::Format.new(@controller, @options).call.map do |_, klass|
        klass.new(@controller, @item, @options)
      end
    end
  end
end
