class AddUserToGitCollaboration < ActiveRecord::Migration[5.2]
  def change
    add_reference :git_collaborations, :user, foreign_key: true
  end
end
