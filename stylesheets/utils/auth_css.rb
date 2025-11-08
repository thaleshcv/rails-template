def setup_auth_css
  file "app/assets/stylesheets/auth.css", <<~CODE
    .auth-container {
      min-height: 100%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }

    .auth-container article {
      width: 100%;
      max-width: 640px;
      border: none;
      box-shadow: var(--shadow);
      background-color: var(--white);
    }

    .auth-container h2 {
      text-align: center;
    }
  CODE
end
