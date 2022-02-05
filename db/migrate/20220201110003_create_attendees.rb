class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :event_id, null: false 
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :attendees, :event_id
    add_index :attendees, :user_id
  end
end
