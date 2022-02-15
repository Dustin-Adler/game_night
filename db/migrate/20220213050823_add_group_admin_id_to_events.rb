class AddGroupAdminIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :group_admin_id, :integer, null: false
  end
end
