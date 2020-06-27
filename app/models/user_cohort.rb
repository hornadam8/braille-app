class UserCohort < ApplicationRecord
    belongs_to :student, class_name: "User"
    belongs_to :student_cohort, class_name: "Cohort"
end
