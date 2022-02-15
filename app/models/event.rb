class Event < ApplicationRecord

    belongs_to :group, 
        foreign_key: :group_id, 
        class_name: :Group

    belongs_to :author, 
        foreign_key: :author_id, 
        class_name: :User

    has_many :attendee_listings, 
        foreign_key: :user_id, 
        class_name: :Atendee

    has_many :attendees, 
        through: :attendee_listings, 
        source: :attender

    belongs_to :game, 
        foreign_key: :game_id, 
        class_name: :Game

end
