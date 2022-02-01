class AddDBconstraintsToGames < ActiveRecord::Migration[5.0]
  def change
    change_column_null :games, :game_name, false
    change_column_null :games, :description, false
    change_column_null :games, :video_game, false
    change_column_null :games, :genre, false
  end
end
