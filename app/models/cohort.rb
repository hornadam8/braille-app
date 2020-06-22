class Cohort < ApplicationRecord 
    has_secure_password
    belongs_to :teacher, class_name: "User"
    has_many :students, class_name: "User"
    validates :title, presence: true
end