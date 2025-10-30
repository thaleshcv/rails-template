def setup_pagy
  initializer "pagy.rb", <<~CODE
    Rails.application.config.to_prepare do
      ApplicationController.include Pagy::Backend
      ApplicationHelper.include Pagy::Frontend
    end

    Pagy::DEFAULT[:limit] = 10
    Pagy::I18n.load(locale: "pt-BR")
  CODE
end
