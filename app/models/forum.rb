class Forum < ApplicationRecord
  belongs_to :comment
  belongs_to :user
  belongs_to :category
end
