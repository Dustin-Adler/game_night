class AddPendingToGroupMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :group_members, :pending, :boolean, null: false
  end
end
