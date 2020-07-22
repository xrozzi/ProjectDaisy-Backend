class Conversation < ApplicationRecord
    has_many :messages
    has_many :users_conversations
    has_many :users, through: :users_conversations
end
