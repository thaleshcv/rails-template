def setup_locale_en
  file "config/locales/en.yml", <<~CODE, force: true
    en:
      application:
        name: #{Rails.application.name}
  CODE
end
