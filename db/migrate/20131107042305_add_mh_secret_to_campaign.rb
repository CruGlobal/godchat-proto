class AddMhSecretToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :missionhub_secret, :string
  end
end
