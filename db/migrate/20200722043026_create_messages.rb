class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :msg_content
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true

      t.timestamps
    end
  end
end
