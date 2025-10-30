Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_controllers
  setup_application_controller

  # home controller
  rails_command("generate controller home index")
  route "root to: 'home#index'"
end
