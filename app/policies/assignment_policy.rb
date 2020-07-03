class AssignmentPolicy < ApplicationPolicy
    attr_reader :user,:assignment

    def initialize(user,assignment)
        @user = user
        @assignment = assignment
    end

    def new?
        if @user.current_role == "Teacher"
            true
        end
    end

    def create?
        if @user.current_role == "Teacher"
            true
        end
    end

    def edit?
        if @user.current_role == "Teacher" && @assignment.cohort.teacher == @user
          true
        end
    end

    def update?
      if @user.current_role == "Teacher" && @assignment.cohort.teacher == @user
        true
      end
    end

    def show?
      if (@user.current_role == "Teacher" && @user == @assignment.cohort.teacher) ||
        @assignment.cohort.students.include?(@user) && @user.current_role == "Student"
        true
      else
        false
      end
    end

    def index?
      if @user.current_role == "Student"
        true
      else
        false
      end
    end

    def destroy?
      if @user.current_role == "Teacher" && @user == @assignment.cohort.teacher
        true
      end
    end

end
