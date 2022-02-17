class Chat < ApplicationRecord
  validates :author_id, :event_id, :comment, presence: true

  belongs_to :event,
             foreign_key: :event_id,
             class_name: :Event

  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User
end
