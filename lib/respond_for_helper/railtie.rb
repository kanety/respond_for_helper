# frozen_string_literal: true

module RespondForHelper
  class Railtie < Rails::Railtie
    ActiveSupport.on_load :action_controller do
      ActionController::Base.send :include, RespondForHelper::Controller
    end

    ActiveSupport.on_load :action_view do
      ActionView::Base.send :include, RespondForHelper::Helper
    end

    ActiveSupport.on_load :i18n do
      I18n.load_path += Dir[File.join(__dir__, 'locales', '*.yml')]
    end
  end
end
