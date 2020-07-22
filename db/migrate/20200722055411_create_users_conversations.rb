class CreateUsersConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :users_conversations do |t|
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
