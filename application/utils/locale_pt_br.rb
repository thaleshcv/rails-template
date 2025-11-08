def setup_locale_pt_br
  file "config/locales/pt_br.yml", <<~CODE, force: true
    pt-BR:
      application:
        name: #{Rails.application.name}
  CODE
end
