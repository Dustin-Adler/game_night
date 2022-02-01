class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.integer :friend_1_id, null: false
      t.integer :friend_2_id, null: false
      t.boolean :pending, null: false

      t.timestamps
    end
    add_index :friends, :friend_1_id
    add_index :friends, :friend_2_id
  end
end
