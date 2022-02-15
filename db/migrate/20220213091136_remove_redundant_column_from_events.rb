class RemoveRedundantColumnFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :group_admin_id
  end
end
