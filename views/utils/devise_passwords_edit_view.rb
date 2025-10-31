# frozen_string_literal: true

def setup_devise_sessions_edit_view
  file "app/views/devise/passwords/edit.html.erb", <<~'CODE'
    <div class="auth-container">
      <h1><%= Rails.application.name.capitalize %></h1>
      <article>
        <h2><%= t("devise.passwords.new.forgot_your_password") %></h2>

        <% if flash.alert %>
          <div class="alert alert-danger"><%= flash.alert %></div>
        <% end %>

        <%= simple_form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :put }) do |f| %>
          <%= f.error_notification %>
          <%= f.input :reset_password_token, as: :hidden %>
          <%= f.full_error :reset_password_token %>
          <%= f.input :password,
            required: true,
            autofocus: true,
            hint: ("#{@minimum_password_length} characters minimum" if @minimum_password_length),
            input_html: { autocomplete: "new-password" } %>
          <%= f.input :password_confirmation,
            required: true,
            input_html: { autocomplete: "new-password" } %>
          <div>
            <%= f.button :submit, t("devise.passwords.edit.change_my_password")  %>
          </div>
        <% end %>
        <div>
          <%= render "devise/shared/links" %>
        </div>
      </article>
    </div>
  CODE
end
