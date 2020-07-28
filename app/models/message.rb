class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation
  def created_at
    attributes['created_at'].strftime("%a %m/%d/%Y %H:%M")
  end
end
