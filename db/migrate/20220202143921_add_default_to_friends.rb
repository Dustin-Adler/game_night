class AddDefaultToFriends < ActiveRecord::Migration[5.0]
  def change
    change_column_default :friends, :pending, :true
    change_column_default :group_members, :pending, :true
  end
end
