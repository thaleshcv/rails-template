def setup_site_nav_css
  file "app/assets/stylesheets/site-nav.css", <<~CODE
    .site-nav {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 1rem;
      padding: 0.5rem 1rem;
      border-bottom: 1px solid rgba(0, 0, 0, 0.06);
      background: var(--accent, #fff);
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
    }

    .site-nav .brand {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      font-weight: 700;
      text-decoration: none;
      color: var(--accent-text);
    }

    .site-nav .nav-links {
      display: flex;
      gap: 1rem;
      align-items: center;
    }

    .site-nav .nav-links a {
      text-decoration: none;
      padding: 0.4rem 0.6rem;
      border: none;
      color: var(--accent-text);
    }

    .site-nav .nav-links a:hover,
    .site-nav .nav-links a:focus {
      background: var(--accent-hover);
      outline: none;
    }

    .nav-toggle {
      display: none;
      background: none;
      border: 0;
      font-size: 1.3rem;
      padding: 0.4rem;
      margin: 0 !important;
      border-radius: 6px;
    }
    .nav-toggle:focus {
      outline: 2px solid Highlight;
      outline-offset: 2px;
    }

    @media (max-width: 720px) {
      .nav-toggle {
        display: inline-flex;
        align-items: center;
        color: var(--accent-text);
      }
      .site-nav .nav-links {
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
        background: var(--accent, #fff);
        display: none;
      }
      .site-nav .nav-links.open {
        display: flex;
      }
      .site-nav {
        position: relative;
      }
    }
  CODE
end
