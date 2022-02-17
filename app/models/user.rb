class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attr_accessor :login

  has_many :friend_1s,                # User could be in either the friend 1 or the friend 2 column of the friends table.
           foreign_key: :friend_1_id,
           class_name: :Friend,
           dependent: :destroy

  has_many :friend_2s,                # friends table only has one row for a pair of friends.
           foreign_key: :friend_2_id,
           class_name: :Friend,
           dependent: :destroy

  has_many :group_listings,           # GroupMember is a joins/connection table used to connect a user to a group that they are a part of.
           foreign_key: :user_id,
           class_name: :GroupMember,
           dependent: :destroy

  has_many :member_groups, # through relationship using "group_listings" to get a list of groups that a user belongs to.
           through: :group_listings,
           source: :group

  has_many :admin_groups, # Admins will not be listed within members, so to finding all groups that a user belongs to requires finding the groups that they admin/manage as well.
           foreign_key: :admin_id,
           class_name: :Group,
           dependent: :destroy

  has_many :events,
           foreign_key: :author_id,
           class_name: :Event,
           dependent: :destroy

  has_many :favorite_games_listings,
           foreign_key: :user_id,
           class_name: :FavoriteGame,
           dependent: :destroy

  has_many :favorite_games,
           through: :favorite_games_listings,
           source: :game

  has_many :event_listings,
           foreign_key: :user_id,
           class_name: :Attendee,
           dependent: :destroy

  has_many :attending_events,
           through: :event_listings,
           source: :Event

  has_many :chats,
           foreign_key: :author_id,
           class_name: :Chat,
           dependent: :destroy

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(username) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end
end
