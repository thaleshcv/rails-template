# frozen_string_literal: true

def setup_devise_registrations_new_view
  file "app/views/devise/registrations/new.html.erb", <<~'CODE'
    <div class="auth-container">
      <h1><%= Rails.application.name.capitalize %></h1>
      <article>
        <h2><%= t("devise.registrations.new.sign_up") %></h2>

        <% if flash.alert %>
          <div class="alert alert-danger"><%= flash.alert %></div>
        <% end %>

        <%= simple_form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
          <%= f.input :email,
            required: false,
            autofocus: true,
            input_html: { autocomplete: "email" } %>
          <%= f.input :password,
            required: true,
            hint: ("#{@minimum_password_length} characters minimum" if @minimum_password_length),
            input_html: { autocomplete: "new-password" } %>
          <%= f.input :password_confirmation,
            required: true,
            input_html: { autocomplete: "new-password" } %>
          <div class="d-grid">
            <%= f.button :submit, "Sign Up" %>
          </div>
        <% end %>
        <div>
          <%= render "devise/shared/links" %>
        </div>
      </article>
    </div>
  CODE
end
