def setup_turbo_confirm_partial
  file "app/views/layouts/_turbo_confirm.html.erb", <<~CODE
    <dialog id="turbo-confirm" style="min-width: 320px;">
      <h6><%= t("turbo_confirm.title") %></h6>
      <form method="dialog">
        <p><%= t("turbo_confirm.undone") %></p>
        <div class="flex flex-gap justify-around">
          <button class="flex-auto button primary" value="confirm">
            <%= t("turbo_confirm.ok") %>
          </button>
          <button class="flex-auto" value="cancel">
            <%= t("turbo_confirm.cancel") %>
          </button>
        </div>
      </form>
    </dialog>
  CODE
end
