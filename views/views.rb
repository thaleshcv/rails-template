Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_views
  setup_turbo_confirm_partial
  setup_navbar_partial
  setup_application_layout
  setup_main_layout
  setup_devise_sessions_edit_view
  setup_devise_passwords_new_view
  setup_devise_registrations_new_view
  setup_devise_sessions_new_view
end
