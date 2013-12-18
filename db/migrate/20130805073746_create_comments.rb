class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :outsider
      t.belongs_to :insider
      t.text :body

      t.timestamps
    end
    add_index :comments, :outsider_id
    add_index :comments, :insider_id
  end
end
