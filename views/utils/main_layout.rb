# frozen_string_literal: true

def setup_main_layout
  file "app/views/layouts/main.html.erb", <<~CODE
    <%= content_for :content do %>
      <%= render 'layouts/navbar' %>
      <main>
        <section class="main-container">
          <%= yield %>
        </section>
        <%= render partial: "layouts/toast_container" %>
        <%= render partial: "layouts/turbo_confirm" %>
      </main>
      <footer>
        &copy;2025 <%= t("application.name") %>
      </footer>
    <% end %>
    <%= render template: 'layouts/application' %>
  CODE
end
