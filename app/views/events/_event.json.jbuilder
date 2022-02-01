json.extract! event, :id, :group_id, :game_id, :required_players, :details, :date, :created_at, :updated_at
json.url event_url(event, format: :json)
