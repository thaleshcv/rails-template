# frozen_string_literal: true

require_relative "misc/gems"
require_relative "misc/application"
require_relative "misc/secure_token_param_concern"
require_relative "misc/simple_form_bootstrap"
require_relative "components/toast_component"
require_relative "components/toast_container_component"
require_relative "components/user_dropdown_component"
require_relative "models/devise_user"
require_relative "views/topbar_partial"
require_relative "views/application_layout"
require_relative "views/main_layout"
require_relative "views/devise_passwords_edit_view"
require_relative "views/devise_passwords_new_view"
require_relative "views/devise_registrations_new"
require_relative "views/devise_sessions_new_view"
require_relative "controllers/application_controller"
require_relative "javascript/custom_turbo_confirmation"
require_relative "stimulus/toast_controller"

# ruby gems
setup_gems

# application and environments
setup_application_rb
setup_secure_token_param_concern
setup_simple_form_bootstrap

# compoents
setup_toast_component
setup_toast_container_component
setup_user_dropdown_component

# models
setup_devise_user_model

# view files
setup_topbar_partial
setup_application_layout
setup_main_layout
setup_devise_passwords_new_view
setup_devise_registrations_new_view
setup_devise_sessions_edit_view
setup_devise_sessions_new_view

# controllers
setup_application_controller

# javascript and stimulus
setup_custom_turbo_confirmation
setup_stimulus_toast_controller

# home controller
rails_command("generate controller home index")
route "root to: 'home#index'"
