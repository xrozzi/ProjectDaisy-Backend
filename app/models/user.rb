class User < ApplicationRecord
    Rails.application.routes.url_helpers

    has_secure_password

    # validates :email, presence: true, 
    # format: { with: /\A[^\.]([a-z0-9\.]){1,64}\@([a-z0-9\.]){1,255}/i, 
    # message: "Invalid email address" }


    has_many :git_collaborations
    has_many :messages
    has_many :users_conversations
    has_many :conversations, through: :users_conversations
    has_one_attached :image
    has_many :forums
    has_many :comments, :dependent => :destroy

    def to_token_payload
        {
            sub: id,
            email: email
        }
    end

end




