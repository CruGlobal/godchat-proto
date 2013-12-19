class RemoveDomainFromCampaigns < ActiveRecord::Migration
  def change
  	remove_column :campaigns, :domain
  end
end
