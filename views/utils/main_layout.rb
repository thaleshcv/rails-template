# frozen_string_literal: true

def setup_main_layout
  file "app/views/layouts/main.html.erb", <<~CODE
    <%= content_for :content do %>
      <%= render 'layouts/topbar' %>
      <main class="main-container">
        <section class="body-content">
          <%= yield %>
        </section>
        <%= render ToastContainerComponent.new %>
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
      </main>
      <footer class="footer">
        &copy;2025 Untitled Inc.
      </footer>
    <% end %>
    <%= render template: 'layouts/application' %>
  CODE
end
