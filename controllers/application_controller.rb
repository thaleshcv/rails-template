# frozen_string_literal: true

def setup_application_controller
  file "app/controllers/concerns/select_layout.rb", <<~CODE
    module SelectLayout
      extend ActiveSupport::Concern

      included do
        layout :select_layout

        private

        def select_layout
          user_signed_in? ? "main" : "application"
        end
      end
    end
  CODE

  inject_into_class "app/controllers/application_controller.rb", "ApplicationController", <<~CODE
    \tinclude SelectLayout\n
    \tbefore_action :authenticate_user!\n
  CODE
end
