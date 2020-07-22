class Cohort < ApplicationRecord
    has_secure_password

    belongs_to :instructor, class_name: "User"
    has_many :user_cohorts, dependent: :delete_all
    has_many :students, class_name: "User", through: :user_cohorts

    has_many :assignments, dependent: :delete_all
    has_many :papers, through: :assignments

    validates :title, presence: true

    after_create do |cohort|
      cohort.instructor.instructor_cohorts << cohort
      cohort.instructor.save
    end

    def self.search(search)
    if search
      @cohort = self.all.select{|cohort| cohort.title.include?(search.titleize)}[0]
      if @cohort
        self.where(title: @cohort.title)
      else
        @cohort = self.all
      end
    else
      @cohort = self.all
    end
    @cohort
  end
end
