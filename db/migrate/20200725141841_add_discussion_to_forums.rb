class AddDiscussionToForums < ActiveRecord::Migration[5.2]
  def change
    add_column :forums, :discussion, :text
  end
end
