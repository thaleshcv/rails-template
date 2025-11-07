def setup_dropdown_css
  file "app/assets/stylesheets/dropdown.css", <<~'CODE'
    .dropdown {
      position: relative;
      display: inline-block;
    }
    .dropdown-button {
      background-color: #f5f5f5;
      border: 1px solid #ccc;
      border-radius: 0.5rem;
      padding: 0.5rem 1rem;
      cursor: pointer;
      transition: background-color 0.2s ease;
      margin-bottom: 0;
    }
    .dropdown-button:hover {
      background-color: var(--bg) !important;
      color: var(--accent) !important;
    }
    .dropdown-button::after {
      content: "\25BE";
      position: absolute;
      right: 2px;
      top: 50%;
      transform: translateY(-50%);
    }

    /* Default alignment: left */
    .dropdown-menu {
      position: absolute;
      top: 100%;
      left: 0;
      min-width: 160px;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 0.5rem;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
      margin-top: 4px;
      z-index: 1000;
      list-style: none;
      padding: 0.25rem 0;
      display: flex;
      flex-direction: column;
      text-align: left;
    }
    /* Right-aligned menu */
    .dropdown-right .dropdown-menu {
      left: auto;
      right: 0;
    }
    .dropdown-item {
      margin: 0;
      width: 100%;
    }
    .dropdown-link {
      display: block;
      width: 100%;
      padding: 0.5rem 8px;
      margin: 0;
      text-decoration: none;
      color: var(--accent);
      border-radius: 0;
    }
    .dropdown-link:hover {
      background-color: #f0f0f0;
    }
    .hidden {
      display: none;
    }
    .dropdown-separator > hr {
      background-color: var(--text-light);
    }
  CODE
end
