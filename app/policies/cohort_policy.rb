require 'pry'
class CohortPolicy < ApplicationPolicy
    attr_reader :user,:cohort

    def initialize(user,cohort)
        @user = user
        @cohort = cohort
    end

    def new?
        if @user.role.name == "Instructor"
            true
        end
    end

    def create?
        if @user.role.name == "Instructor"
            true
        end
    end

    def edit?
        if @user.role.name == "Instructor" && @cohort.instructor == @user
          true
        end
    end

    def update?
      if @user.role.name == "Instructor" && @cohort.instructor == @user
        true
      end
    end

    def show?
      if (@user.role.name == "Instructor" && @user == @cohort.instructor) ||
        @cohort.students.include?(@user) && @user.role.name == "Student"
        true
      end
    end

    def index?
      if @user.role.name == "Student"
        true
      end
    end

    def destroy?
      if @user.role.name == "Instructor" && @user == @cohort.instructor
        true
      end
    end

end
