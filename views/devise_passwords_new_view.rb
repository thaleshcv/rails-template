# frozen_string_literal: true

def setup_devise_passwords_new_view
  file "app/views/devise/passwords/new.html.erb", <<~CODE
    <div class="min-vh-100 d-flex flex-column justify-content-center align-items-center">
      <div class="bg-white p-4 shadow rounded w-100" style="max-width: 400px;">
        <div class="text-center">
          <h2 class="my-3">
            <%= t("devise.passwords.new.forgot_your_password") %>
          </h2>
        </div>
        <%= simple_form_for(resource, as: resource_name, url: password_path(resource_name), html: { method: :post }) do |f| %>
          <%= f.error_notification %>
          <%= f.input :email,
                    required: true,
                    autofocus: true,
                    input_html: { autocomplete: "email" } %>
          <div class="d-grid">
            <%= f.button :submit, t("devise.passwords.new.send_me_reset_password_instructions"), class: "btn-primary" %>
          </div>
        <% end %>
        <div class="my-3">
          <%= render "devise/shared/links" %>
        </div>
      </div>
    </div>
  CODE
end
