class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true
    validates_with EmailValidator

    has_many :user_roles
    has_many :roles, through: :user_roles
    has_many :teacher_cohorts, class_name: "Cohort"
    has_many :user_cohorts
    has_many :student_cohorts, class_name: "Cohort",through: :user_cohorts


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

    def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

end
