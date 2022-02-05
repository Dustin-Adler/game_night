class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :group_id, null: false
      t.integer :game_id, null: false
      t.integer :required_players, null: false
      t.text :details, null: false
      t.datetime :date, null: false

      t.timestamps
    end
    add_index :events, :group_id 
    add_index :events, :game_id
  end
end
