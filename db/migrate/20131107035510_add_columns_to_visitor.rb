class AddColumnsToVisitor < ActiveRecord::Migration
  def change
    add_column :visitors, :first_name, :string
    add_column :visitors, :last_name, :string
    add_column :visitors, :fb_username, :string
    add_column :visitors, :gender, :string
    add_column :visitors, :fb_access_token, :string
    add_column :visitors, :fb_refresh_token, :string

    rename_column :visitors, :campaign_id, :last_campaign_id

    add_index :visitors, :missionhub_id
    add_index :visitors, :last_campaign_id
  end
end
