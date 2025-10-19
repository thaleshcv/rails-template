# frozen_string_literal: true

def setup_user_dropdown_component
  file "app/components/user_dropdown_component.rb", <<~CODE
    # frozen_string_literal: true

    # Current user dropdown for navbars.
    #
    # Usage:
    # <%= render UserDropdownComponent.new(user: current_user) do %>
    #   <li>
    #     <%= link_to "Perfil", profile_path, class: "dropdown-item" %>
    #   </li>
    #   <li>
    #     <%= link_to "Configurações", settings_path, class: "dropdown-item" %>
    #   </li>
    # <% end %>
    class UserDropdownComponent
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::UrlHelper
      include ActionView::Helpers::FormTagHelper
      include ActionView::Helpers::CaptureHelper
      include ActionView::Helpers::TextHelper
      include ActionView::Helpers::TranslationHelper

      def initialize(user:)
        @user = user
      end

      def render_in(view_context, &block)
        @view_context = view_context
        @block_content = view_context.capture(&block) if block_given?

        content_tag(:li, class: "nav-item dropdown") do
          dropdown_toggle + dropdown_menu
        end
      end

      private

      attr_reader :user, :view_context, :block_content

      delegate :button_to, :destroy_user_session_path, to: :view_context

      def dropdown_toggle
        link_classes = "d-flex align-items-center gap-1 text-decoration-none dropdown-toggle p-1 rounded"

        tag.a(class: link_classes,
              "data-bs-toggle": "dropdown",
              href: "#",
              role: "button",
              "aria-haspopup": "true",
              "aria-expanded": "false") do
          avatar + user_info
        end
      end

      def avatar
        if user.picture.present?
          image_tag(user.picture, class: "img-fluid rounded", size: "42x42")
        else
          initial = user.name.to_s.strip.first&.upcase || "?"
          tag.span(initial,
            class: "d-inline-flex justify-content-center align-items-center bg-secondary text-white rounded",
            style: "width:42px; height:42px; font-weight:bold; font-size:1rem;")
        end
      end

      def user_info
        tag.span(class: "d-flex flex-column") do
          name_line
        end
      end

      def name_line
        tag.span(class: "text-truncate", style: "max-width:99.9%;") do
          truncate(user.name, length: 12)
        end
      end

      def dropdown_menu
        content_tag(:ul, class: "dropdown-menu dropdown-menu-end") do
          safe_join([block_content, logout_item].compact)
        end
      end

      def logout_item
        content_tag(:li) do
          button_to("Logout", destroy_user_session_path, method: :delete, class: "dropdown-item")
        end
      end
    end
  CODE
end
