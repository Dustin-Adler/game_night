class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :event_id, null: false
      t.integer :author_id, null: false 
      t.text :comment, null: false

      t.timestamps
    end
    add_index :chats, :event_id
    add_index :chats, :author_id
  end
end
