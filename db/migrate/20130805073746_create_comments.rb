class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :outsider
      t.belongs_to :operator
      t.text :body

      t.timestamps
    end
    add_index :comments, :outsider_id
    add_index :comments, :operator_id
  end
end
