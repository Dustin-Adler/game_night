class CreateFavoriteGames < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_games do |t|
      t.integer :game_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :favorite_games, :game_id
    add_index :favorite_games, :user_id
  end
end
