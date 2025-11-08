# frozen_string_literal: true

Dir[File.join(File.expand_path("./utils", __dir__), "**", "*.rb")].sort.each { |file| require file }

def setup_application
  setup_locale_en
  setup_locale_pt_br

  new_code = <<~CODE
    \t\tconfig.i18n.default_locale = "pt-BR"
    \t\tconfig.time_zone = "Brasilia"
  CODE

  insert_into_file "config/application.rb", new_code, :after => "config.load_defaults 8.0\n"
end
