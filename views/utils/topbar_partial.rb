# frozen_string_literal: true

def setup_topbar
  file "app/views/layouts/_topbar.html.erb", <<~CODE
    <header class="site-nav" data-controller="navbar">
      <a href="#" class="brand">
        <svg width="28" height="28" viewBox="0 0 24 24" aria-hidden="true">
          <circle cx="12" cy="12" r="10" fill="currentColor" opacity="0.12"></circle>
          <path d="M7 12h10" stroke="currentColor" stroke-width="2" stroke-linecap="round"></path>
        </svg>
        <%= Rails.application.name.capitalize %>
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
    </header>
  CODE
end
