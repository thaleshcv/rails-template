# frozen_string_literal: true

def setup_navbar
  file "app/views/layouts/_navbar.html.erb", <<~CODE
    <header class="navbar" data-controller="navbar">
      <a href="#" class="brand">
        <svg width="28" height="28" viewBox="0 0 24 24" aria-hidden="true">
          <circle cx="12" cy="12" r="10" fill="currentColor" opacity="0.12"></circle>
          <path d="M7 12h10" stroke="currentColor" stroke-width="2" stroke-linecap="round"></path>
        </svg>
        <%= t("application.name") %>
      </a>

      <button
        data-navbar-target="toggle"
        data-action="click->navbar#toggleMenu"
        class="nav-toggle"
        aria-expanded="false"
        aria-label="Abrir menu">☰</button>
      <nav data-navbar-target="menu" class="nav-links" aria-label="Links principais">
        <a href="#home">Home</a>
        <a href="#sobre">Sobre</a>
        <a href="#servicos">Serviços</a>
        <a href="#contato">Contato</a>
        <a href="#login" class="outline">Entrar</a>
      </nav>

      <%= render DropdownComponent.new(
        align: :right,
        label: truncate(current_user.name, length: 12),
        items: [
          { label: "Edit", url: root_path, class: "text-success" },
          { label: "Delete", url: root_path, class: "text-danger" },
          :separator,
          { label: "View details", url: root_path }
        ]
      ) %>
    </header>
  CODE
end
