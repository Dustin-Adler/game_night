json.extract! game, :id, :game_name, :description, :video_game, :genre, :created_at, :updated_at
json.url game_url(game, format: :json)
