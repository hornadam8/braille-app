class Cohort < ApplicationRecord
    belongs_to :teacher, class_name "User"
    has_many :students, class_name "User"
end