def setup_toast_css
  file "app/assets/stylesheets/toast.css", <<~CODE
    #toast_container {
      position: fixed;
      top: 1rem;
      right: 1rem;
      z-index: 9999;
      display: flex;
      flex-direction: column;
      gap: 0.5rem;
    }

    .toast {
      display: flex;
      align-items: center;
      width: 360px;
      padding: 1.2rem 1rem;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
      font-size: 0.9rem;
      cursor: pointer;
      animation: slideInRight 0.3s ease, fadeOut 0.5s ease 5s forwards;
    }

    .toast.success {
      color: var(--color-success);
      background-color: var(--color-success-bg);
    }

    .toast.danger {
      color: var(--color-danger);
      background-color: var(--color-danger-bg);
    }

    @keyframes slideInRight {
      from {
        opacity: 0;
        transform: translateX(20px);
      }
      to {
        opacity: 1;
        transform: translateX(0);
      }
    }

    @keyframes fadeOut {
      to {
        opacity: 0;
        transform: translateY(-10px);
      }
    }
  CODE
end
