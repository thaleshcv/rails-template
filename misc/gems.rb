# frozen_string_literal: true

def add_gems
  gem "devise"
  gem "devise-i18n"
  gem "pagy"
  gem "pundit"
  gem "rails-i18n"
  gem "ransack"
  gem "rubocop"
  gem "simple_form"

  gem_group :development, :test do
    gem "factory_bot_rails"
    gem "faker"
    gem "rspec-rails"
  end
end

def setup_pagy
  initializer "pagy.rb", <<~CODE
    require "pagy/extras/bootstrap"

    Rails.application.config.to_prepare do
      ApplicationController.include Pagy::Backend
      ApplicationHelper.include Pagy::Frontend
    end

    Pagy::DEFAULT[:limit] = 10
    Pagy::I18n.load(locale: "pt-BR")
  CODE
end

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

def setup_gems
  add_gems

  `bundle install`

  rails_command("generate simple_form:install --bootstrap")
  rails_command("generate pundit:install")
  rails_command("generate devise:install")
  rails_command("active_storage:install")

  setup_rspec
  setup_pagy

  # remove commented lines from Gemfile
  gsub_file "Gemfile", /^\s*#.*\n/, ""
end
