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

        content_tag(:div, id: "toast_container") do
          safe_join(flash_messages)
        end
      end

      private

      attr_reader :view_context

      delegate :flash, to: :view_context

      def flash_messages
        flash.map { |type, message| view_context.render ToastComponent.new(type, message) }
      end
    end
  CODE
end
