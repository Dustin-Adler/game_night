class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.integer :admin_id, null: false 
      t.string :group_name, null: false 
      t.text :description

      t.timestamps
    end
    add_index :groups, :admin_id
  end
end
