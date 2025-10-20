# frozen_string_literal: true

def setup_custom_turbo_confirmation
  append_to_file "app/javascript/application.js", <<~CODE
    \n\n
    /*
     * Custom confirm dialog for Turbo
     */
    Turbo.config.forms.confirm = (message, element) => {
      let dialog = document.getElementById("turbo-confirm");
      dialog.querySelector("p").textContent = message;
      dialog.showModal();

      return new Promise((resolve, reject) => {
        dialog.addEventListener(
          "close",
          () => {
            resolve(dialog.returnValue == "confirm");
          },
          { once: true }
        );
      });
    };
  CODE
end
