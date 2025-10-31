def setup_extras_css
  file "app/assets/stylesheets/extras.css", <<~CODE
    /* === Simple.css Utility Layer === */
    /* Clean, modern, with rounded corners and soft shadows */

    :root {
      --radius: 8px;
      --shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
      --space: 1rem;
    }

    body {
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

    /* === Responsive Helpers === */
    @media (max-width: 768px) {
      .flex-column-md {
        flex-direction: column;
      }
      .hidden-md {
        display: none;
      }
    }
  CODE
end
