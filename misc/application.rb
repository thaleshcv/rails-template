# frozen_string_literal: true

def setup_application_rb
  application <<~CODE
    # start rails-template
    config.i18n.default_locale = "pt-BR"
    config.time_zone = "Brasilia"
    # end rails-template\n
  CODE
end
