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

    body[data-layout="main"] .site-nav {
      grid-area: navbar;
    }

    body[data-layout="main"] .main-container {
      grid-area: main;
    }

    body[data-layout="main"] .footer {
      grid-area: footer;
    }
  CODE
end
