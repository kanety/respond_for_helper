# frozen_string_literal: true

module RespondForHelper
  module Formats
    class Html < Base
      def respond
        respond_to do |format|
          format.html { yield }
        end
      end

      def _index
        render @options[:template] || :index
      end

      def _show
        render @options[:template] || :show
      end

      def default_action
        if succeeded?
          render_or_redirect(:template, :location, :notice)
        else
          render_or_redirect(:failure_template, :failure_location, :alert)
        end
      end

      def render_or_redirect(template_key, location_key, type)
        behaviour = resolve_behaviour(template_key, location_key)
        if behaviour[0] == :template
          message = resolve_flash(type)
          flash.now[type] = message if message
          render resolve_template(behaviour[1]), status: render_status
        else
          message = resolve_flash(type)
          flash[type] = message if message
          redirect_to resolve_location(behaviour[1])
        end
      end

      def render_status
        if succeeded?
          :ok
        else
          :unprocessable_entity
        end
      end

      def resolve_flash(type)
        return if request.xhr?
        @controller.respond_for_message(type, @options)
      end

      def resolve_behaviour(template_key, location_key)
        [ [:template, @options[template_key]],
          [:location, @options[location_key]],
          [:template, behaviour_config(template_key)],
          [:location, behaviour_config(location_key)]
        ].each do |behaviour|
          return behaviour if behaviour[1].present?
        end
        [:location, url_for(action: :index)]
      end

      def behaviour_config(key)
        [@controller.class.respond_for_behaviours, Config.default_behaviours].each do |behaviours|
          behaviour = behaviours&.dig(key, action_name.to_sym) || behaviours&.dig(key, :_default)
          return behaviour if behaviour
        end
        return nil
      end

      def resolve_template(template)
        if template.respond_to?(:call)
          @controller.instance_exec(&template)
        else
          template
        end
      end

      def resolve_location(location)
        if location.respond_to?(:call)
          @controller.instance_exec(&location)
        elsif location.is_a?(Symbol)
          if location.in?(Config.member_actions)
            url_for(action: location, id: @item)
          else
            url_for(action: location)
          end
        else
          location
        end
      end
    end
  end
end
