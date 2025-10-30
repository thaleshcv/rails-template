Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_components
  setup_toast_container_component
  setup_toast_component
  setup_user_dropdown_component
end
