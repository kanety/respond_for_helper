# frozen_string_literal: true

module RespondForHelper
  class Config
    class_attribute :data

    self.data = {
      formats: [:html, :json, :any],
      formatters: {
        turbo_stream: RespondForHelper::Formats::TurboStream,
        html: RespondForHelper::Formats::Html,
        json: RespondForHelper::Formats::Json,
        any: RespondForHelper::Formats::Any
      },
      flasher: RespondForHelper::Flashes::Timestamp,
      behaviours: {
        turbo_stream: {
          _default: {
            success: { render: -> { action_name.to_sym }, status: :ok },
            failure: { render: -> { action_name.to_sym }, status: :unprocessable_entity }
          }
        },
        html: {
          index: { render: :index },
          show: { render: :show },
          create: {
            success: { redirect: :index, status: :see_other, flash: :notice },
            failure: { render: :new, status: :unprocessable_entity, flash: :alert }
          },
          update: {
            success: { redirect: :index, status: :see_other, flash: :notice },
            failure: { render: :edit, status: :unprocessable_entity, flash: :alert }
          },
          destroy: {
            success: { redirect: :index, status: :see_other, flash: :notice },
            failure: { render: :show, status: :unprocessable_entity, flash: :alert }
          },
          _default: {
            success: { redirect: :index, status: :see_other, flash: :notice },
            failure: { render: :show, status: :unprocessable_entity, flash: :alert }
          }
        },
        json: {
          index: { render: :item },
          show: { render: :item },
          create: {
            success: { render: :item, status: :created },
            failure: { render: :item_errors, status: :unprocessable_entity }
          },
          update: {
            success: { render: :item, status: :ok },
            failure: { render: :item_errors, status: :unprocessable_entity }
          },
          destroy: {
            success: { head: :no_content },
            failure: { head: :unprocessable_entity }
          },
          _default: {
            success: { render: :item, status: :ok },
            failure: { render: :item_errors, status: :unprocessable_entity }
          }
        },
        any: {
          index: { render: :index },
          show: { render: :show }
        }
      }
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
