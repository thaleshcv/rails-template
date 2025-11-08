def setup_extras_css
  file "app/assets/stylesheets/extras.css", <<~CODE
    /* === Simple.css Utility Layer === */
    @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400;1,700&display=swap");

    :root {
      --sans-font: Poppins, sans-serif;
      --radius: 8px;
      --shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
      --space: 1rem;
      --bg: #f5f5f5;
      --white: #fff;
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

    dialog {
      text-align: center;
      box-shadow: var(--shadow);
    }

    /* primary button */
    .button.primary {
      background-color: var(--accent);
      color: var(--accent-text);
    }

    /* generic button */
    button,
    .button,
    a.button,
    input[type="submit"],
    input[type="reset"],
    input[type="button"] {
      border: var(--border-width) solid var(--accent);
      background-color: var(--bg);
      color: var(--accent);
      padding: 0.5em;
      text-decoration: none;
      line-height: normal;
    }

    /* hovered button */
    button:enabled:hover,
    .button:not([aria-disabled="true"]):hover,
    input[type="submit"]:enabled:hover,
    input[type="reset"]:enabled:hover,
    input[type="button"]:enabled:hover {
      background-color: var(--accent-hover);
      border-color: var(--accent-hover);
      cursor: pointer;
      color: var(--accent-text);
    }

    /* disabled button */
    .button[aria-disabled="true"],
    input:disabled,
    textarea:disabled,
    select:disabled,
    button[disabled] {
      cursor: not-allowed;
      background-color: var(--disabled);
      border-color: var(--disabled);
      color: var(--text-light);
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
    .flex-gap {
      gap: 1rem;
    }
    .flex-auto {
      flex: 1;
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
    .justify-around {
      justify-content: space-around;
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

    /* === Force light mode === */
    @media (prefers-color-scheme: dark) {
      :root {
        color-scheme: light;
        --bg: #f5f5f5;
        --white: #fff;
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
