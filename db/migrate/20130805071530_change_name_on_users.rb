class ChangeNameOnUsers < ActiveRecord::Migration
  def up
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
  end

  def down
  end
end
