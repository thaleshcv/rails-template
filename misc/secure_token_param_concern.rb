# frozen_string_literal: true

def setup_secure_token_param_concern
  file "app/models/concerns/secure_token_param.rb", <<~CODE
    # frozen_string_literal: true
    module SecureTokenParam
      extend ActiveSupport::Concern

      included do
        has_secure_token

        def to_param = token
      end
    end
  CODE
end
