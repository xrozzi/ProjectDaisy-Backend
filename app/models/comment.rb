class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :forum

  validates :content, presence: true
  accepts_nested_attributes_for :user
end


