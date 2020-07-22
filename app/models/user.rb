class User < ApplicationRecord
    Rails.application.routes.url_helpers

    has_secure_password
    has_many :git_collaborations
    has_many :messages
    has_many :conversations
    has_one_attached :image

    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

    def get_image_url
        url_for(self.image)
    end

    validates :image, {presence: true}
end
