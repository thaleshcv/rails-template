# frozen_string_literal: true

def setup_stimulus_toast_controller
  rails_command("generate stimulus toast")

  file "app/javascript/controllers/toast_controller.js", <<~CODE
    import { Controller } from "@hotwired/stimulus";
    import { Toast } from "bootstrap";

    // Connects to data-controller="toast"
    export default class extends Controller {
      initialize() {
        this.remove = this.remove.bind(this);
      }

      connect() {
        this.toast = new Toast(this.element);
        this.element.addEventListener("hidden.bs.toast", this.remove);

        if (!this.toast.isShown()) {
          this.toast.show();
        }
      }

      disconnect() {
        this.element.removeEventListener("hidden.bs.toast", this.remove);
        this.toast.dispose();
      }

      remove() {
        this.element.remove();
      }
    }
  CODE
end
