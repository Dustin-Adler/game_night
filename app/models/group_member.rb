class GroupMember < ApplicationRecord

    validates :group_id, :user_id, presence: true 
    validates :user_id, uniqueness: { scope: :group_id, message: "is already a member of this group" }
    validate :admin_is_not_added_as_member


    belongs_to :group, 
        foreign_key: :group_id, 
        class_name: :Group 

    belongs_to :member_of_group, 
        foreign_key: :user_id, 
        class_name: :User 


    def admin_is_not_added_as_member
        if user_id == group_admin_id(group_id)
            errors.add(:user_id, "is the admin of this group")
        end
    end

    def group_admin_id(group_id)
        Group.find_by(id: group_id).admin.id
    end
end
