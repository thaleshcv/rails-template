# frozen_string_literal: true

def setup_toast_component
  file "app/components/toast_component.rb", <<~'CODE'
    # frozen_string_literal: true

    class ToastComponent
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::CaptureHelper

      TOAST_TYPE_COLORS = {
        "notice" => "success",
        "alert" => "danger"
      }.freeze

      def initialize(type, message)
        @type = type
        @message = message
      end

      def render_in(view_context)
        @view_context = view_context

        content_tag(:div, toast_wrapper, class: "toast-container position-fixed top-0 end-0 p-3")
      end

      private

      attr_reader :view_context

      delegate :flash, :button_tag, to: :view_context

      def toast_wrapper
        toast_classes = token_list(['toast', 'align-items-center', 'border-0', toast_color])
        content_tag(:div,
          toast_inner,
          class: toast_classes,
            role: "alert", aria: { live: "assertive", atomic: "true" },
            data: { controller: "toast" })
      end

      def toast_inner
        content_tag(:div, class: "d-flex") do
          toast_body + toast_dismiss
        end
      end

      def toast_body
        content_tag(:div, @message, class: "toast-body")
      end

      def toast_dismiss
        content_tag(:button, nil,
          type: "button",
          class: "btn-close btn-close-white me-2 m-auto",
          "data-bs-dismiss": "toast",
          "aria-label": "Close")
      end

      def toast_color
        toast_color = "text-bg-#{TOAST_TYPE_COLORS[@type]}"
      end
    end
  CODE
end
