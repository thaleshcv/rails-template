# frozen_string_literal: true

def setup_application_layout
  file "app/views/layouts/application.html.erb", <<~CODE, force: true
    <!DOCTYPE html>
    <html>
      <head>
        <title><%= content_for(:title) || Rails.application.name.capitalize %></title>
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="turbo-prefetch" content="false">
        <%= csrf_meta_tags %>
        <%= csp_meta_tag %>

        <%= yield :head %>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link rel="manifest" href="/manifest.json">
        <link rel="icon" href="/icon.png" type="image/png">
        <link rel="icon" href="/icon.svg" type="image/svg+xml">
        <link rel="apple-touch-icon" href="/icon.png">
        <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
        <%= javascript_include_tag "application", "data-turbo-track": "reload", type: "module" %>
      </head>

      <body>
        <%= content_for?(:content) ? yield(:content) : yield %>
      </body>
    </html>
  CODE
end
