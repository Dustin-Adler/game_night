class Event < ApplicationRecord
  validates :title, :group_id, :game_id, :required_players, :details, :date, :author_id, :admin_id, :title,
            presence: true

  belongs_to :group,
             foreign_key: :group_id,
             class_name: :Group

  belongs_to :author,
             foreign_key: :author_id,
             class_name: :User

  has_many :attendee_listings,
           foreign_key: :event_id,
           class_name: :Attendee

  has_many :attendees,
           through: :attendee_listings,
           source: :attender

  belongs_to :game,
             foreign_key: :game_id,
             class_name: :Game

  has_many :chats,
           foreign_key: :event_id,
           class_name: :Chat,
           dependent: :destroy

  def start_time
    date
  end
end
