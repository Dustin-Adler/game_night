class Group < ApplicationRecord

    validates :group_name, :description, presence: true 
    validates :group_name, length: { in: 4..25,
        message: "has to be between 4 and 20 chars" }
    validates :description, length: { maximum: 350, 
        message: "must be less than 350 chars"}

    belongs_to :admin, 
        foreign_key: :admin_id, 
        class_name: :User

    has_many :group_member_listings,
        foreign_key: :group_id,
        class_name: :GroupMember, 
        dependent: :destroy

    has_many :members, 
        through: :group_member_listings,
        source: :member_of_group

    has_many :events, 
        foreign_key: :group_id, 
        class_name: :Event, 
        dependent: :destroy

    def self.users_groups(user)
        managed_groups = user.admin_groups.includes(:admin, :members)
        membered_groups = user.member_groups.includes(:admin, :members)
        all_groups = managed_groups += membered_groups
    end
end
