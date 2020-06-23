class Cohort < ApplicationRecord 
    has_secure_password
    belongs_to :teacher, class_name: "User"
    has_many :user_cohorts
    has_many :students, class_name: "User", through: :user_cohorts
    validates :title, presence: true
end