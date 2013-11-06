class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :cname
      t.string :youtube_url

      t.timestamps
    end
  end
end
