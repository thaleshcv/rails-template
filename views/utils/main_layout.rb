# frozen_string_literal: true

def setup_main_layout
  file "app/views/layouts/main.html.erb", <<~CODE
    <%= content_for :content do %>
      <%= render 'layouts/navbar' %>
      <main class="main-container">
        <section class="body-content">
          <%= yield %>
        </section>
        <%= render ToastContainerComponent.new %>
        <%= render partial: "layouts/turbo_confirm" %>
      </main>
      <footer class="footer">
        &copy;2025 <%= t("application.name") %>
      </footer>
    <% end %>
    <%= render template: 'layouts/application' %>
  CODE
end
