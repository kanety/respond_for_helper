# frozen_string_literal: true

module RespondForHelper
  class Config
    class_attribute :data

    self.data = {
      flash: RespondForHelper::Flash,
      formats: {
        html: RespondForHelper::Formats::Html,
        json: RespondForHelper::Formats::Json
      },
      default_behaviours: {
        template: {},
        location: {},
        failure_template: { create: :new, update: :edit, destroy: :show, _default: :show },
        failure_location: { _default: :show }
      },
      member_actions: [:show, :edit, :update, :destroy]
    }

    data.keys.each do |key|
      define_singleton_method "#{key}" do
        data[key]
      end

      define_singleton_method "#{key}=" do |val|
        data[key] = val
      end
    end
  end
end
