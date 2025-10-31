def setup_auth_css
  file "app/assets/stylesheets/auth.css", <<~CODE
    .auth-container {
      min-height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }

    .auth-container article {
      width: 100%;
      max-width: 640px;
    }

    .auth-container h2 {
      text-align: center;
    }
  CODE
end
