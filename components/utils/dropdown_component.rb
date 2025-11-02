# frozen_string_literal: true

def setup_dropdown_component
  file "app/components/dropdown_component.rb", <<~CODE
    # frozen_string_literal: true

    # == DropdownComponent
    #
    # A lightweight, self-contained dropdown component for Ruby on Rails views.
    # Generates all HTML using Rails' `tag` helper, with no external dependencies
    # such as Bootstrap or jQuery.
    #
    # The dropdown behavior is controlled via a Stimulus controller (`dropdown_controller.js`).
    #
    # === Example
    #
    #   <%= render DropdownComponent.new(
    #     label: "Actions",
    #     button_class: "btn-primary",
    #     menu_class: "menu-rounded",
    #     items: [
    #       { label: "Edit", url: edit_user_path(@user), class: "text-blue" },
    #       { label: "Delete", url: user_path(@user), method: :delete, data: { confirm: "Are you sure?" }, class: "text-red" },
    #       :separator,
    #       { label: "View details", url: user_path(@user) }
    #     ]
    #   ) %>
    class DropdownComponent
      include ActionView::Helpers::TagHelper
      include ActionView::Context
      include ActionView::Helpers::UrlHelper

      def initialize(label:, items:, button_class: nil, menu_class: nil, align: :left)
        @label = label
        @items = items
        @button_class = button_class
        @menu_class = menu_class
        @align = align.to_sym
      end

      def render_in(view_context)
        @view_context = view_context

        tag.div(class: dropdown_classes, data: { controller: "dropdown" }) do
          dropdown_button + dropdown_menu
        end
      end

      private

      def dropdown_classes
        classes = ["dropdown"]
        classes << "dropdown-right" if @align == :right
        classes.join(" ")
      end

      def dropdown_button
        tag.button(
          @label,
          type: "button",
          class: ["dropdown-button", @button_class].compact.join(" "),
          data: { action: "click->dropdown#toggle" }
        )
      end

      def dropdown_menu
        menu_items = @items.map do |item|
          if item == :separator
            item_separator
          else
            dropdown_item(item)
          end
        end

        tag.ul(
          safe_join(menu_items),
          class: ["dropdown-menu hidden", @menu_class].compact.join(" "),
          data: { dropdown_target: "menu" }
        )
      end

      def dropdown_item(item)
        item_class = ["dropdown-item", item[:class]].compact.join(" ")

        tag.li(class: item_class) do
          @view_context.link_to(
            item[:label],
            item[:url],
            class: "dropdown-link",
            method: item[:method],
            data: item[:data]
          )
        end
      end

      def item_separator
        tag.li(tag.hr, class: "dropdown-item dropdown-separator")
      end
    end
  CODE
end
