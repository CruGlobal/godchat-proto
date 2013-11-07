class AddDomainToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :domain, :string
    add_index :campaigns, :domain
  end
end
