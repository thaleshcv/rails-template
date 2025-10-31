# frozen_string_literal: true

def setup_application_controller
  file "app/controllers/concerns/select_layout.rb", <<~CODE
    module SelectLayout
      extend ActiveSupport::Concern

      included do
        layout :select_layout
        helper_method :current_layout

        private

        def select_layout
          @_current_layout = user_signed_in? ? "main" : "application"
        end

        def current_layout
          @_current_layout
        end
      end
    end
  CODE

  inject_into_class "app/controllers/application_controller.rb", "ApplicationController", <<~CODE
    \tinclude SelectLayout\n
    \tbefore_action :authenticate_user!\n
  CODE
end
