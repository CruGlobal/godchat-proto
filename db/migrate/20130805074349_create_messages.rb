class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.belongs_to :user
      t.belongs_to :conversation

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :conversation_id
  end
end
