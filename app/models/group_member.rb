class GroupMember < ApplicationRecord

    validates :group_id, :user_id, presence: true 

    belongs_to :group, 
        foreign_key: :group_id, 
        class_name: :Group 

    belongs_to :member_of_group, 
        foreign_key: :user_id, 
        class_name: :User 

end
