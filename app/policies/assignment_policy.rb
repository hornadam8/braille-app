class AssignmentPolicy < ApplicationPolicy
    attr_reader :user,:assignment

    def initialize(user,assignment)
        @user = user
        @assignment = assignment
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
        if @user.role.name == "Teacher" && @assignment.cohort.teacher == @user
          true
        end
    end

    def update?
      if @user.role.name == "Teacher" && @assignment.cohort.teacher == @user
        true
      end
    end

    def show?
      if (@user.role.name == "Teacher" && @user == @assignment.cohort.teacher) ||
        @assignment.cohort.students.include?(@user) && @user.role.name == "Student"
        true
      else
        false
      end
    end

    def index?
      if @user.role.name == "Student"
        true
      else
        false
      end
    end

    def destroy?
      if @user.role.name == "Teacher" && @user == @assignment.cohort.teacher
        true
      end
    end

end
