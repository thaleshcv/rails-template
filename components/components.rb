Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_components
  setup_notice_component
  setup_toast_component
  setup_dropdown_component
end
