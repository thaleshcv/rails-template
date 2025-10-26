# frozen_string_literal: true

def setup_discardable_concern
  file "app/models/concerns/discardable.rb", <<~CODE
    # frozen_string_literal: true

    # Concern to provide a soft-delete mechanism to models.
    module Discardable
      extend ActiveSupport::Concern

      included do
        scope :discarded, -> { where.not(discarded_at: nil) }
        scope :not_discarded, -> { where(discarded_at: nil) }

        define_model_callbacks :discard, :restore

        def discarded?
          discarded_at_in_database.present?
        end

        def discard!
          run_callbacks :discard do
            update_attribute!(:discarded_at, Time.current)
          end
        end

        def restore!
          run_callbacks :restore do
            update_attribute!(:discarded_at, nil)
          end
        end
      end
    end
  CODE
end
