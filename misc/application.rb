# frozen_string_literal: true

def setup_application_rb
  new_code = <<~CODE
    \t\tconfig.i18n.default_locale = "pt-BR"
    \t\tconfig.time_zone = "Brasilia"
  CODE

  insert_into_file "config/application.rb", new_code, :after => "config.load_defaults 8.0\n"
end
