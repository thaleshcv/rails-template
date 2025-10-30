# frozen_string_literal: true

def setup_devise_sessions_new_view
  file "app/views/devise/sessions/new.html.erb", <<~CODE
    <div class="min-vh-100 d-flex flex-column justify-content-center align-items-center">
      <div class="bg-white p-4 shadow rounded w-100" style="max-width: 400px;">
        <div class="text-center">
          <h2 class="mb-3">Login</h2>
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
                    required: false,
                    input_html: { autocomplete: "current-password" } %>
          <%= f.input :remember_me, as: :boolean if devise_mapping.rememberable? %>
          <div class="d-grid">
            <%= f.button :submit, "Log in", class: "btn-primary" %>
          </div>
        <% end %>
        <div class="my-3">
          <%= render "devise/shared/links" %>
        </div>
      </div>
    </div>
  CODE
end
