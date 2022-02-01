json.extract! favorite_game, :id, :game_id, :user_id, :created_at, :updated_at
json.url favorite_game_url(favorite_game, format: :json)
