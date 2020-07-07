class Cohort < ApplicationRecord
    has_secure_password

    belongs_to :teacher, class_name: "User"
    has_many :user_cohorts, dependent: :delete_all
    has_many :students, class_name: "User", through: :user_cohorts

    has_many :assignments, dependent: :delete_all
    has_many :papers, through: :assignments

    validates :title, presence: true

    after_create do |cohort|
      cohort.teacher.teacher_cohorts << cohort
      cohort.teacher.save
    end
end
