# frozen_string_literal: true

def setup_devise_sessions_new_view
  file "app/views/devise/sessions/new.html.erb", <<~CODE
    <div class="auth-container">
      <h1><%= Rails.application.name.capitalize %></h1>
      <article>
        <h2><%= t("devise.sessions.new.sign_in") %></h2>

        <% if flash.alert %>
          <div class="alert alert-danger"><%= flash.alert %></div>
        <% end %>

        <%= simple_form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
          <%= f.input :email,
            required: false,
            autofocus: true,
            input_html: { autocomplete: "email" } %>
          <%= f.input :password,
            required: false,
            input_html: { autocomplete: "current-password" } %>
          <%= f.input :remember_me, as: :boolean if devise_mapping.rememberable? %>
          <div>
            <%= f.button :submit, "Log in" %>
          </div>
        <% end %>
        <div>
          <%= render "devise/shared/links" %>
        </div>
      </article>
    </div>
  CODE
end
