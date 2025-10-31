# frozen_string_literal: true

def setup_devise_passwords_new_view
  file "app/views/devise/passwords/new.html.erb", <<~CODE
    <div class="auth-container">
      <h1><%= Rails.application.name.capitalize %></h1>
      <article>
        <h2><%= t("devise.passwords.new.forgot_your_password") %></h2>

        <% if flash.alert %>
          <div class="alert alert-danger"><%= flash.alert %></div>
        <% end %>

        <%= simple_form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :post }) do |f| %>
          <%= f.error_notification %>
          <%= f.input :email,
            required: true,
            autofocus: true,
            input_html: { autocomplete: "email" } %>
          <div>
            <%= f.button :submit, t("devise.passwords.new.send_me_reset_password_instructions") %>
          </div>
        <% end %>
        <div>
          <%= render "devise/shared/links" %>
        </div>
      </article>
    </div>
  CODE
end
