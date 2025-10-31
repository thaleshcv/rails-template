# frozen_string_literal: true

def setup_main_layout
  file "app/views/layouts/main.html.erb", <<~CODE
    <%= content_for :content do %>
      <%= render 'layouts/topbar' %>
      <div class="main-container">
        <section class="body-content">
          <div class="<%= @_main_layout_container_fluid.presence ? 'container-fluid' : 'container' %>">
            <%= render ToastContainerComponent.new %>
            <%= yield %>
          </div>
          <dialog id="turbo-confirm" class="border rounded text-center shadow" style="min-width: 320px;">
            <h6 class="fw-bold"><%= t("turbo_confirm.title") %></h6>
            <form method="dialog">
              <p class="py-3"><%= t("turbo_confirm.undone") %></p>
              <div class="d-grid gap-2 d-md-block">
                <button class="btn btn-primary btn-sm" value="confirm">
                  <%= t("turbo_confirm.ok") %>
                </button>
                <button class="btn btn-secondary btn-sm" value="cancel">
                  <%= t("turbo_confirm.cancel") %>
                </button>
              </div>
            </form>
          </dialog>
        </section>
        <section class="footer-content">
          &copy;2025 Untitled Company
        </section>
      </div>
    <% end %>
    <%= render template: 'layouts/application' %>
  CODE
end
