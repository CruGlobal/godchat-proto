class RemoveChannelFromVisitor < ActiveRecord::Migration
  def change
    remove_column :visitors, :channel
    add_column :conversations, :channel, :string
  end
end
