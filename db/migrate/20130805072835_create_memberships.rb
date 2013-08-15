class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :users
      t.belongs_to :organizations
      t.boolean :valid
      t.boolean :admin
      t.boolean :owner
 
      t.timestamps
    end
    add_index :memberships, :users_id
    add_index :memberships, :organizations_id
  end
end
