# frozen_string_literal: true

def setup_application_scss
  append_file "app/assets/stylesheets/application.bootstrap.scss", <<~CODE
    \n\n.main-container {
      display: grid;
      grid-template-rows: 90px 1fr 70px;
      grid-template-areas:
        "topbar"
        "body"
        "footer";
      min-height: 100vh;
    }

    .topbar-content {
      grid-area: topbar;
    }

    .body-content {
      grid-area: body;
    }

    .footer-content {
      grid-area: footer;
      text-align: center;
    }
  CODE
end
