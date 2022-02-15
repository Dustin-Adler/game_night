class AddIndexOnGroupAdminIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_index :events, :group_admin_id
  end
end
