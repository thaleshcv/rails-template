# frozen_string_literal: true

def setup_toast_component
  file "app/components/toast_component.rb", <<~'CODE'
    # frozen_string_literal: true

    class ToastComponent
      include ActionView::Helpers::TagHelper
      include ActionView::Helpers::CaptureHelper

      TOAST_COLORS = {
        "notice" => "success",
        "alert" => "danger"
      }.freeze

      def initialize(type, message)
        @type = type
        @message = message
      end

      def render_in(view_context)
        @view_context = view_context

        content_tag(:div, @message, class: toast_classes)
      end

      private

      attr_reader :view_context

      delegate :flash, to: :view_context

      def toast_classes
        toast_color_name = TOAST_COLORS[@type.to_s]
        token_list(["toast", { "bg-#{toast_color_name}" => toast_color_name.present? }])
      end
    end
  CODE
end
