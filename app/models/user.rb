class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true
    validates_with EmailValidator


    has_many :user_roles, dependent: :delete_all
    has_many :roles, through: :user_roles
    has_many :teacher_cohorts, class_name: "Cohort"
    has_many :user_cohorts, dependent: :delete_all
    has_many :student_cohorts, class_name: "Cohort",through: :user_cohorts


    def cohorts
      if current_role == "Teacher"
        teacher_cohorts
      elsif current_role == "Student"
        student_cohorts
      end
    end

    def teaches_this(obj)
      if obj.class == Cohort && obj.teacher == self && current_role == "Teacher"
        true
      elsif obj.class == Assignment && obj.cohort.teacher == self  && current_role == "Teacher"
        true
      elsif obj.class == Paper && obj.assignment.cohort.teacher == self && current_role == "Teacher"
        true
      else
        false
      end
    end

    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.name = auth.info.name
        user.email = auth.info.email
      end
    end

end
