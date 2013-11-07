class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :fb_uid
      t.string :channel
      t.integer :missionhub_id
      t.integer :campaign_id
      t.string :locale
      t.text :answers

      t.timestamps
    end
  end
end
