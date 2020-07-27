class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :forum

 
  accepts_nested_attributes_for :user
end


