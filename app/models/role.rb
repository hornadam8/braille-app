class Role < ApplicationRecord
    has_many :UserRoles
    has_many :Users, through: :UserRoles
    validates :name, presence: true, uniqueness: true
end
