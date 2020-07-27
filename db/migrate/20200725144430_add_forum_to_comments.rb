class AddForumToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :forum, foreign_key: true
  end
end
