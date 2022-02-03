class Friend < ApplicationRecord

    validates :friend_1_id, :friend_2_id, :pending, presence: true

    belongs_to :friend_1, 
        foreign_key: :friend_1_id,
        class_name: :User

    belongs_to :friend_2, 
        foreign_key: :friend_2_id,
        class_name: :User

    def self.get_friends(current_user)
        friends_table_rows = Friend.where(friend_1_id: current_user.id).or(Friend.where(friend_2_id: current_user.id))
        friends = []
        friends_table_rows.each do |row|
          friends.push(User.find_by(id: row.friend_1_id).username) if row.friend_2_id == current_user.id
          friends.push(User.find_by(id: row.friend_2_id).username) if row.friend_1_id == current_user.id
        end
        friends
    end

end
