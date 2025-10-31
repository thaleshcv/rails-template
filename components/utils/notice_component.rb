def setup_notice_component
  file "app/components/notice_component.rb", <<~'CODE'
    # frozen_string_literal: true

    class NoticeComponent
      include ActionView::Helpers::TagHelper

      TYPE_COLORS = {
        "notice" => "success",
        "alert" => "danger"
      }.freeze

      def initialize(type, message)
        @type = type
        @message = message
      end

      def render_in(_view_context)
        content_tag(:p, @message, class: notice_classes)
      end

      private

      def notice_classes
        notice_color_name = TYPE_COLORS[@type.to_s]
        token_list("notice", "bg-#{notice_color_name}" => notice_color_name.present?)
      end
    end
  CODE
end
