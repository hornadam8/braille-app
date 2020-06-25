class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true
    validates_with EmailValidator

    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :teacher_cohorts, class_name: "Cohort"
    has_many :student_cohorts, class_name: "Cohort"

    #def role?(role)
        #roles.any? { |r| r.name.underscore.to_sym == role }
    #end

    def cohorts
        if current_role == "Teacher"
            teacher_cohorts
        elsif current_role == "Student"
            student_cohorts
        end
    end

end
