Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_gems
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

  `bundle install`

  rails_command("generate simple_form:install")
  rails_command("generate pundit:install")
  rails_command("generate devise:install")
  rails_command("active_storage:install")

  setup_rspec
  setup_pagy
  setup_simple_form

  # remove commented lines from Gemfile
  gsub_file "Gemfile", /^\s*#.*\n/, ""
end
