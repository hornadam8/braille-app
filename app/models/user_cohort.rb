class UserCohort < ApplicationRecord
    belongs_to :student, class_name: "User"
    belongs_to :cohort
end