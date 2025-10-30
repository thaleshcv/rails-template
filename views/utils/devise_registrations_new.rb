# frozen_string_literal: true

def setup_devise_registrations_new_view
  file "app/views/devise/registrations/new.html.erb", <<~CODE
    <div class="min-vh-100 d-flex flex-column justify-content-center align-items-center">
      <div class="bg-white p-4 shadow rounded w-100" style="max-width: 400px;">
        <div class="text-center">
          <h2 class="mb-3">Sign Up</h2>
        </div>

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
            <%= f.button :submit, "Sign Up", class: "btn-primary" %>
          </div>
        <% end %>
        <div class="my-3">
          <%= render "devise/shared/links" %>
        </div>
      </div>
    </div>
  CODE
end
