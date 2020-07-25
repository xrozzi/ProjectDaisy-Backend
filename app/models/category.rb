class Category < ApplicationRecord
    has_many :Categories
    has_many :Forums
end
