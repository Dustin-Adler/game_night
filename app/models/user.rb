class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  attr_accessor :login

  has_many :friend_1s,                #User could be in either the friend 1 or the friend 2 column of the friends table. 
    foreign_key: :friend_1_id, 
    class_name: :Friend 

  has_many :friend_2s,                #friends table only has one row for a pair of friends.
    foreign_key: :friend_2_id, 
    class_name: :Friend

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup 
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
      { value: login.strip.downcase}]).first 
  end

end
