json.extract! attendee, :id, :event_id, :user_id, :created_at, :updated_at
json.url attendee_url(attendee, format: :json)
