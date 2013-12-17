class ChangeInsiderToOperator < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.update("update users set type = 'Operator' where type = 'Insider'")

    rename_column :comments, :insider_id, :operator_id
    rename_column :conversations, :insider_id, :operator_id
  end
end
