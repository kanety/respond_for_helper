# frozen_string_literal: true

module RespondForHelper
  module Helper
    delegate :respond_for_message, to: :controller
  end
end
