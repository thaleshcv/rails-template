# frozen_string_literal: true

def setup_devise_sessions_edit_view
  file "app/views/devise/passwords/edit.html.erb", <<~CODE
    <div class="min-vh-100 d-flex flex-column justify-content-center align-items-center">
      <div class="bg-white p-4 shadow rounded w-100" style="max-width: 400px;">
        <div class="text-center">
          <h2 class="my-3">
            <%= t("devise.passwords.edit.change_your_password") %>
          </h2>
        </div>
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
          <div class="d-grid">
            <%= f.button :submit, t("devise.passwords.edit.change_my_password"), class: "btn-primary" %>
          </div>
        <% end %>
        <div class="my-3">
          <%= render "devise/shared/links" %>
        </div>
      </div>
    </div>
  CODE
end
