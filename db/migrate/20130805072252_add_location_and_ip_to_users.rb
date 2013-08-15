class AddLocationAndIpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :ip, :string
  end
end
