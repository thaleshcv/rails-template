# frozen_string_literal: true

def setup_topbar
  file "app/views/layouts/_topbar.html.erb", <<~CODE
    <nav class="navbar fixed-top navbar-expand-lg bg-primary" data-bs-theme="dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          MyApplication
        </a>
        <button class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbar01"
          aria-controls="navbar01"
          aria-expanded="false"
          aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar01">
          <ul class="navbar-nav ms-auto align-items-center">
            <li class="nav-item">
              <%= link_to root_path, class: "nav-link active" do %>
                Home
                <span class="visually-hidden">(current)</span>
              <% end %>
            </li>
            <li class="nav-item">
              <%= link_to root_path, class: "nav-link" do %>
                Link
              <% end %>
            </li>
            <%= render UserDropdownComponent.new(user: current_user) %>
          </ul>
        </div>
      </div>
    </nav>
  CODE
end
