# frozen_string_literal: true

def setup_stimulus_toast_controller
  rails_command("generate stimulus toast")

  file "app/javascript/controllers/toast_controller.js", <<~CODE, force: true
    import { Controller } from "@hotwired/stimulus";

    export default class extends Controller {
      connect() {
        this.element.addEventListener("click", () => this.dismiss());
        this.element.addEventListener("animationend", (event) => {
          if (event.animationName === "fadeOut") {
            this.dismiss();
          }
        });
      }

      dismiss() {
        if (this._removed) return;
        this._removed = true;
        this.element.remove();
      }
    }
  CODE
end
