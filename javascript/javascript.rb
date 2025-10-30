Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_javascript
  setup_custom_turbo_confirmation
end
