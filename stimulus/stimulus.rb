Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_stimulus
  setup_stimulus_navbar_controller
  setup_stimulus_toast_controller
end
