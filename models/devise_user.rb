# frozen_string_literal: true

def setup_devise_user_model
  rails_command("generate devise user token:string name:string discarded_at:datetime")

  inject_into_class "app/models/user.rb", "User", <<~CODE
    \tinclude Discardable, SecureTokenParam\n
    \thas_one_attached :picture\n
  CODE
end
