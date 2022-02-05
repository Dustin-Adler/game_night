class Friend < ApplicationRecord

    validates :friend_1_id, :friend_2_id, presence: { message: "Sorry, username was not found. Please check spelling and capitalization, then try again"}
    validates :friend_1_id, uniqueness: {scope: :friend_2_id, message: "You're already friends!"}

    belongs_to :friend_1, 
        foreign_key: :friend_1_id,
        class_name: :User

    belongs_to :friend_2, 
        foreign_key: :friend_2_id,
        class_name: :User

    def self.get_friends(current_user)
        # using the include statements makes sure that no matter how many friends a user has they only hit the server 3 times.
        user_is_friend_1 = Friend.where(friend_1_id: current_user.id).includes(:friend_2) #gets Friend rows where user sent a friend request, also grabs the user info of the friend
        user_is_friend_2 = Friend.where(friend_2_id: current_user.id).includes(:friend_1) #gets Friend rows where user recieved a friend request, also grabs the user info of the friend
        all_friends = user_is_friend_1 += user_is_friend_2
        friends = []
        all_friends.each do |row|
          friends.push({id: row.id, username: row.friend_1.username}) if row.friend_2_id == current_user.id
          friends.push({id: row.id, username: row.friend_2.username}) if row.friend_1_id == current_user.id
        end 
        friends.sort do |a, b| a[:username].first <=> b[:username].first end #arranges friends list alphabetically
    end

end
