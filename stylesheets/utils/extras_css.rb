def setup_extras_css
  file "app/assets/stylesheets/extras.css", <<~CODE
    /* === Simple.css Utility Layer === */
    :root {
      --radius: 8px;
      --shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
      --space: 1rem;
      --color-success: #28a745;
      --color-danger: #dc3545;
      --color-warning: #ffc107;

      --color-success-bg: #d4edda;
      --color-danger-bg: #f8d7da;
      --color-warning-bg: #fff3cd;
    }

    body {
      display: block;
      min-height: 100vh;
    }

    /* === Flexbox === */
    .flex {
      display: flex;
    }
    .inline-flex {
      display: inline-flex;
    }

    .flex-row {
      flex-direction: row;
    }
    .flex-column {
      flex-direction: column;
    }

    .justify-start {
      justify-content: flex-start;
    }
    .justify-center {
      justify-content: center;
    }
    .justify-end {
      justify-content: flex-end;
    }
    .justify-between {
      justify-content: space-between;
    }

    .items-start {
      align-items: flex-start;
    }
    .items-center {
      align-items: center;
    }
    .items-end {
      align-items: flex-end;
    }

    /* === Spacing === */
    .padding {
      padding: var(--space);
    }
    .margin {
      margin: var(--space);
    }

    .padding-top {
      padding-top: var(--space);
    }
    .padding-bottom {
      padding-bottom: var(--space);
    }
    .padding-left {
      padding-left: var(--space);
    }
    .padding-right {
      padding-right: var(--space);
    }

    .margin-top {
      margin-top: var(--space);
    }
    .margin-bottom {
      margin-bottom: var(--space);
    }
    .margin-left {
      margin-left: var(--space);
    }
    .margin-right {
      margin-right: var(--space);
    }

    /* === Text Alignment === */
    .text-left {
      text-align: left;
    }
    .text-center {
      text-align: center;
    }
    .text-right {
      text-align: right;
    }

    /* === Width & Height === */
    .width-full {
      width: 100%;
    }
    .height-full {
      height: 100%;
    }

    /* === Border Radius & Shadow === */
    .rounded {
      border-radius: var(--radius);
    }
    .shadow {
      box-shadow: var(--shadow);
    }

    /* === Transitions === */
    .transition {
      transition: all 0.2s ease-in-out;
    }
    .hover-lift:hover {
      box-shadow: var(--shadow);
      transform: translateY(-2px);
    }

    /* === Color Utilities === */
    .text-success {
      color: var(--color-success);
    }
    .text-danger {
      color: var(--color-danger);
    }
    .text-warning {
      color: var(--color-warning);
    }

    .bg-success {
      background-color: var(--color-success-bg);
      color: var(--color-success);
    }
    .bg-danger {
      background-color: var(--color-danger-bg);
      color: var(--color-danger);
    }
    .bg-warning {
      background-color: var(--color-warning-bg);
      color: var(--color-warning);
    }

    .notice.bg-success {
      border-color: var(--color-success);
    }
    .notice.bg-danger {
      border-color: var(--color-danger);
    }
    .notice.bg-warning {
      border-color: var(--color-warning);
    }

    /* === Responsive Helpers === */
    @media (max-width: 768px) {
      .flex-column-md {
        flex-direction: column;
      }
      .hidden-md {
        display: none;
      }
    }

    @media (prefers-color-scheme: dark) {
      :root {
        color-scheme: light;
        --bg: #fff;
        --accent-bg: #f5f7ff;
        --text: #212121;
        --text-light: #585858;
        --accent: #0d47a1;
        --accent-hover: #1266e2;
        --accent-text: var(--bg);
        --code: #d81b60;
        --preformatted: #444;
        --marked: #ffdd33;
        --disabled: #efefef;
      }
    }
  CODE
end
