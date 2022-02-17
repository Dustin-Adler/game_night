class Game < ApplicationRecord
  validates :game_name, uniqueness: true

  has_many :user_favorited_listings,
           foreign_key: :game_id,
           class_name: :FavoriteGame,
           dependent: :destroy

  has_many :user_favorites,
           through: :user_favorited_listings,
           source: :user

  has_many :events,
           foreign_key: :game_id,
           class_name: :Event
end
