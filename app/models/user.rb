class User < ApplicationRecord
    Rails.application.routes.url_helpers

    has_secure_password
    has_many :git_collaborations
    has_many :messages
    has_many :users_conversations
    has_many :conversations, through: :users_conversations


    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

end
