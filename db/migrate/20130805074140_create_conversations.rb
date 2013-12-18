class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :topic
      t.belongs_to :insider
      t.belongs_to :outsider

      t.timestamps
    end
    add_index :conversations, :insider_id
    add_index :conversations, :outsider_id
  end
end
