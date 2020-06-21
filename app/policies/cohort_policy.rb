class CohortPolicy < ApplicationPolicy
    attr_reader :user,:cohort

    def initialize(user,cohort)
        @user = user
        @cohort = cohort
    end

    def new?
        if @user.current_role == "Teacher"
            true
        else
            false
        end
    end

    def edit?
        @user.current_role == "Teacher"
    end

end