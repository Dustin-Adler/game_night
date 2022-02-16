json.extract! chat, :id, :event_id, :author_id, :comment, :created_at, :updated_at
json.url chat_url(chat, format: :json)
