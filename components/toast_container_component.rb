# frozen_string_literal: true

def setup_toast_container_component
  file "app/components/toast_container_component.rb", <<~CODE
    # frozen_string_literal: true

    class ToastContainerComponent
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::CaptureHelper

      def initialize; end

      def render_in(view_context)
        @view_context = view_context

        content_tag(:div,
          flash_messages,
          id: "toast_container",
          class: "toast-container position-fixed top-0 end-0 p-3")
      end

      private

      attr_reader :view_context

      delegate :flash, to: :view_context

      def flash_messages
        safe_join(flash.map { |type, message| view_context.render ToastComponent.new(type, message) })
      end
    end
  CODE
end
