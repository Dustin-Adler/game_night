class AddAuthorIdAndAdminIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :author_id, :integer, null: false 
    add_column :events, :admin_id, :integer, null: false 
    add_index :events, :author_id 
    add_index :events, :admin_id
  end
end
