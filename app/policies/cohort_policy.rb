class CohortPolicy < ApplicationPolicy
    attr_reader :user,:cohort

    def initialize(user,cohort)
        @user = user
        @cohort = cohort
    end

    def new?
        if @user.current_role == "Teacher"
            true
        end
    end

    def edit?
        if @user.current_role == "Teacher" && @cohort.teacher == @user
          true
        end
    end

    def show?
      if (@user.current_role == "Teacher" && @user == @cohort.teacher) || @cohort.students.include?(@user)
        true
      else
        false
      end
    end

end
