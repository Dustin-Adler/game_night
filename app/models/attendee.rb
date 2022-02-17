class Attendee < ApplicationRecord
  validates :user_id, uniqueness: { scope: :event_id,
                                    message: 'is already scheduled to be at this event.' }

  belongs_to :attender,
             foreign_key: :user_id,
             class_name: :User

  belongs_to :event,
             foreign_key: :event_id,
             class_name: :Event
end
