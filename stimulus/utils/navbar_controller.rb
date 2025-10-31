# frozen_string_literal: true

def setup_stimulus_navbar_controller
  rails_command("generate stimulus navbar")

  file "app/javascript/controllers/navbar_controller.js", <<~CODE, force: true
    import { Controller } from "@hotwired/stimulus";

    // Connects to data-controller="navbar"
    export default class extends Controller {
      static targets = ["menu", "toggle"];

      connect() {
        this.closeMenu = this.closeMenu.bind(this);
        document.addEventListener("click", this.closeMenu);
        document.addEventListener(
          "keydown",
          (e) => e.key === "Escape" && this.hide()
        );
        window.addEventListener("resize", () => this.handleResize());
      }

      disconnect() {
        document.removeEventListener("click", this.closeMenu);
      }

      toggleMenu(event) {
        event.stopPropagation();
        const isOpen = this.menuTarget.classList.contains("open");
        isOpen ? this.hide() : this.show();
      }

      show() {
        this.menuTarget.classList.add("open");
        this.toggleTarget.setAttribute("aria-expanded", "true");
        this.toggleTarget.setAttribute("aria-label", "Fechar menu");
      }

      hide() {
        this.menuTarget.classList.remove("open");
        this.toggleTarget.setAttribute("aria-expanded", "false");
        this.toggleTarget.setAttribute("aria-label", "Abrir menu");
      }

      closeMenu(event) {
        if (window.matchMedia("(min-width: 721px)").matches) return;
        if (!this.menuTarget.classList.contains("open")) return;
        if (
          this.toggleTarget.contains(event.target) ||
          this.menuTarget.contains(event.target)
        )
          return;
        this.hide();
      }

      handleResize() {
        if (window.matchMedia("(min-width: 721px)").matches) this.hide();
      }
    }
  CODE
end
