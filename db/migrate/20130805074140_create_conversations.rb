class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :topic
      t.belongs_to :operator
      t.belongs_to :outsider

      t.timestamps
    end
    add_index :conversations, :operator_id
    add_index :conversations, :outsider_id
  end
end
