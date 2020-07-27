class RemoveCommentFromForums < ActiveRecord::Migration[5.2]
  def change
    remove_reference :forums, :comment, foreign_key: true
  end
end
