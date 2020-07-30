class GitCollaboration < ApplicationRecord
    belongs_to :user
    # def created_at
    #     attributes['created_at'].strftime("%a %m/%d/%Y %H:%M")
    #   end
end
