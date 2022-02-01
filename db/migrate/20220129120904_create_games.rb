class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :game_name
      t.text :description
      t.boolean :video_game
      t.string :genre

      t.timestamps
    end
  end
end
