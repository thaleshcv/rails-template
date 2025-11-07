def setup_pagy
  initializer "pagy.rb", <<~CODE
    Rails.application.config.to_prepare do
      ApplicationController.include Pagy::Method
    end

    Pagy.options[:limit] = 10
    Pagy::I18n.locale = "pt-BR"
  CODE
end
