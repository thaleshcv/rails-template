def setup_navbar_css
  file "app/assets/stylesheets/navbar.css", <<~CODE
    /* simple.css reset */
    header nav a,
    header nav a:visited {
      border: none;
    }
    /* end of reset */

    header.navbar {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 1rem;
      padding: 0.5rem 1rem;
      background: var(--accent, #fff);
      border-bottom: 1px solid rgba(0, 0, 0, 0.05);
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
    }

    header.navbar .brand {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      font-weight: 700;
      text-decoration: none;
      color: var(--accent-text);
    }

    header.navbar .nav-links {
      display: flex;
      gap: 1rem;
      align-items: center;
    }

    header.navbar .nav-links a {
      color: var(--accent-text);
      text-decoration: none;
    }

    header.navbar .nav-links a:hover,
    header.navbar .nav-links a:focus {
      background: var(--bg);
      color: var(--accent);
      outline: none;
    }

    header.navbar .nav-toggle {
      display: none;
      background: none;
      border: 0;
      font-size: 1.3rem;
      padding: 0.4rem;
      border-radius: 6px;
    }

    /* dropdown */
    header.navbar .dropdown {
      font-size: 1rem;
    }
    header.navbar .dropdown .dropdown-button {
      background-color: var(--accent);
      color: var(--accent-text);
      border: none;
    }
    /* end dropdown */

    @media (max-width: 720px) {
      header.navbar .nav-toggle {
        display: inline-flex;
        align-items: center;
      }

      header.navbar .nav-links {
        position: absolute;
        top: 100%;
        right: 0;
        left: 0;
        margin: 0.5rem;
        flex-direction: column;
        gap: 0.25rem;
        padding: 0.5rem;
        border-radius: 8px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
        background: var(--bg, #fff);
        display: none;
      }

      header.navbar .nav-links a,
      header.navbar .nav-links a:visited {
        color: var(--accent);
      }

      header.navbar .nav-links.open {
        display: flex;
      }

      header.navbar {
        position: relative;
      }
    }
  CODE
end
