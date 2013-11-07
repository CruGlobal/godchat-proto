class RemoveStuffFromUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      t.column :refresh_token, :string
      t.column :token_expires_at, :datetime
    end
  end
end
