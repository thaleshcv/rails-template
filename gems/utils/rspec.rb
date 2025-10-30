def setup_rspec
  rails_command("generate rspec:install")

  uncomment_lines "spec/rails_helper.rb", %r{spec/support/\*\*/\*\.rb}

  file "spec/support/devise.rb", <<~CODE
    RSpec.configure do |config|
    	config.include Devise::Test::IntegrationHelpers, type: :request
    end
  CODE

  file "spec/support/factory_bot.rb", <<~CODE
    RSpec.configure do |config|
    	config.include FactoryBot::Syntax::Methods
    end
  CODE
end
