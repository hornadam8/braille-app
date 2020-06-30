class Cohort < ApplicationRecord
    has_secure_password

    belongs_to :teacher, class_name: "User"
    has_many :user_cohorts, dependent: :delete_all
    has_many :students, class_name: "User", through: :user_cohorts

    has_many :assignments, dependent: :delete_all

    validates :title, presence: true
end
