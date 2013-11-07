class RenameColumnInsiderIdInConversations < ActiveRecord::Migration
  def change
  	rename_column :conversations, :outsider_id, :visitor_id
  end
end
