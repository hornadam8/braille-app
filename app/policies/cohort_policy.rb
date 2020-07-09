require 'pry'
class CohortPolicy < ApplicationPolicy
    attr_reader :user,:cohort

    def initialize(user,cohort)
        @user = user
        @cohort = cohort
    end

    def new?
        if @user.role.name == "Teacher"
            true
        end
    end

    def create?
        if @user.role.name == "Teacher"
            true
        end
    end

    def edit?
        if @user.role.name == "Teacher" && @cohort.teacher == @user
          true
        end
    end

    def update?
      if @user.role.name == "Teacher" && @cohort.teacher == @user
        true
      end
    end

    def show?
      if (@user.role.name == "Teacher" && @user == @cohort.teacher) ||
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
      if @user.role.name == "Teacher" && @user == @cohort.teacher
        true
      end
    end

end
