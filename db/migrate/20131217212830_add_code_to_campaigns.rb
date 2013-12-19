class AddCodeToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :code, :string

    add_index :campaigns, :code
  end
end
