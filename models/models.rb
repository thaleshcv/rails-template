Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_models
  setup_discardable_concern
  setup_secure_token_param_concern
  setup_devise_user_model
end
