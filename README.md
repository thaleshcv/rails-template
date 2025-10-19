# Rails Template

Um template mínimo para iniciar aplicações Rails com algumas gems, componentes e convenções prontos.

Principais features:

- Autenticação pronta com Devise (usuário com token e avatar via Active Storage)
- Componentes para toasts (notificações) e dropdown de usuário
- Layouts prontos (`application` e `main`) com topbar
- Integração com Stimulus (controller de toast)
- Paginação com Pagy, autorização com Pundit
- Formulários com Simple Form
- Testes com RSpec e helpers para FactoryBot

Status do projeto
-- Projeto template para gerar uma base de aplicação Rails. Não é uma aplicação completa por si só; o `template.rb` gera arquivos e executa comandos para montar a base.

Pré-requisitos

- Ruby (compatível com sua versão de Rails desejada)
- Rails
- Node / yarn (para compilar assets quando aplicável)
- Bootstrap (framework CSS, utilizado nos componentes e layouts)

Gems incluídas

- devise
- devise-i18n
- pagy
- pundit
- rails-i18n
- ransack
- rubocop
- simple_form

Gems para desenvolvimento/teste

- factory_bot_rails
- faker
- rspec-rails

Configurações aplicadas pelo template

- config.i18n.default_locale = "pt-BR"
- config.time_zone = "Brasilia"
- Pagy configurado com extras-bootstrap e limite padrão de 10

Como usar este template

1. Clone este repositório em qualquer pasta local:

   ```sh
   git clone https://github.com/thaleshcv/rails-template.git
   ```

2. Crie uma nova aplicação Rails usando o template.rb deste repositório:

   ```sh
   rails new myapp -m /caminho/absoluto/para/rails-template/template.rb
   ```

   > Dica: O caminho pode ser relativo ou absoluto, mas precisa apontar para o arquivo template.rb clonado.

3. Instale as dependências e finalize a configuração:

   ```sh
   bundle install
   rails db:create db:migrate
   ```

Componentes e views principais

- `app/components/toast_component.rb` e `app/components/toast_container_component.rb` — componentes para exibir flash messages como Bootstrap Toasts integrados com Stimulus.
- `app/components/user_dropdown_component.rb` — dropdown de usuário para o topbar.
- `app/views/layouts/application.html.erb` — layout base com tags e inclusão de assets.
- `app/views/layouts/main.html.erb` — layout usado quando o usuário está autenticado. Inclui `ToastContainerComponent`.
- `app/javascript/controllers/toast_controller.js` — controller Stimulus para controlar o ciclo de vida dos toasts.

Models e Concerns

- `app/models/concerns/secure_token_param.rb` — concern que adiciona `has_secure_token` e sobrescreve `to_param` para usar o token.
- `app/models/user.rb` — gerado com Devise e modificado para incluir `SecureTokenParam` e `has_one_attached :picture`.

Testes

- O template configura RSpec e adiciona suporte para Devise e FactoryBot em `spec/support`.

Contribuição

Este é um template pessoal — sinta-se livre para abrir issues ou enviar PRs com melhorias. Para adaptar localmente, modifique os arquivos em `misc/`, `components/` e `views/` e reexecute o template em um novo projeto.
