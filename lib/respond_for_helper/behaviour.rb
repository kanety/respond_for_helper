# frozen_string_literal: true

module RespondForHelper
  class Behaviour
    TYPES = [:render, :redirect, :head]

    attr_accessor :type, :target, :flash, :options

    def initialize(attrs)
      @type = attrs.delete(:type)
      @target = attrs.delete(:target)
      @flash = attrs.delete(:flash)
      @options = attrs
    end

    def render?
      @type == :render
    end

    def redirect?
      @type == :redirect
    end

    def head?
      @type == :head
    end

    def flash?
      @flash
    end
  end

  class Behaviours
    def initialize(controller, format, result, options)
      @controller = controller
      @format = format
      @result = result
      @options = options

      @controller_behaviours = @controller.respond_for_config.fetch(:behaviours, {})
      @default_behaviours = Config.behaviours
    end

    def call
      behaviour = Behaviour.new(resolve_attributes)

      if @format == :html
        merge_html_options(behaviour)
      end

      behaviour
    end

    private

    def resolve_attributes
      keys1 = [@format, @controller.action_name.to_sym, @result]
      keys2 = [@format, @controller.action_name.to_sym]
      keys3 = [@format, :_default, @result]
      keys4 = [@format, :_default]

      attrs = {}
      attrs.merge!(resolve_attributes_for(@default_behaviours, [keys1, keys2, keys3, keys4]))
      attrs.merge!(resolve_attributes_for(@controller_behaviours, [keys1, keys2, keys3, keys4]))
      attrs.merge!(resolve_attributes_for(@options, [[@format, @result], [@format]]))
      attrs.empty? ? { type: :redirect, target: :index } : attrs
    end

    def resolve_attributes_for(behaviours, keys_list)
      keys_list.each do |keys|
        if (attrs = behaviours.dig(*keys))
          attrs = attrs.deep_dup
          Behaviour::TYPES.each do |type|
            if attrs[type]
              attrs[:type] = type
              attrs[:target] = attrs.delete(type)
            end
          end
          return attrs
        end
      end
      {}
    end

    def merge_html_options(behaviour)
      if @result == :success
        if @options[:template]
          change_to_render(behaviour) if behaviour.type != :render
          behaviour.target = @options[:template]
        end
        if @options[:location]
          change_to_redirect(behaviour) if behaviour.type != :redirect
          behaviour.target = @options[:location]
        end
      else
        if @options[:failure_template]
          change_to_render(behaviour) if behaviour.type != :render
          behaviour.target = @options[:failure_template]
        end
        if @options[:failure_location]
          change_to_redirect(behaviour) if behaviour.type != :redirect
          behaviour.target = @options[:failure_location]
        end
      end
    end

    def change_to_render(behaviour)
      behaviour.type = :render
      behaviour.options[:status] = @result == :success ? :ok : :unprocessable_entity
    end

    def change_to_redirect(behaviour)
      behaviour.type = :redirect
      behaviour.options[:status] = :see_other
    end
  end
end
