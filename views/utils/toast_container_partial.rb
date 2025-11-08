def setup_toast_container_partial
  file "app/views/layouts/_toast_container.html.erb", <<~CODE
    <div id="toast_container">
      <% flash.each do |type, message| %>
        <%= render ToastComponent.new(type, message) %>
      <% end %>
    </div>
  CODE
end
