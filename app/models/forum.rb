class Forum < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :users, through: :comments

  belongs_to :category

  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :comments

end
