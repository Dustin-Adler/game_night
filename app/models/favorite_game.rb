class FavoriteGame < ApplicationRecord
  belongs_to :user,
             foreign_key: :user_id,
             class_name: :User

  belongs_to :game,
             foreign_key: :game_id,
             class_name: :Game
end
