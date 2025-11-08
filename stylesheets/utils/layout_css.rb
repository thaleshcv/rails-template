def setup_layout_css
  file "app/assets/stylesheets/layout.css", <<~CODE
    body[data-layout="main"] {
      display: grid;
      grid-template-columns: none !important;
      grid-template-rows: auto 1fr auto;
      grid-template-areas:
        "navbar"
        "main"
        "footer";
    }

    body[data-layout="main"] > header {
      grid-area: navbar;
    }

    body[data-layout="main"] > main {
      grid-area: main;
    }

    body[data-layout="main"] > footer {
      grid-area: footer;
      margin-top: 0;
    }

    section.main-container {
      padding: 1.5rem !important;
      background-color: var(--white);
      box-shadow: var(--shadow);
      border-radius: var(--radius);
      min-height: 100%;
      border-bottom: none;
      margin: 0;
    }
  CODE
end
