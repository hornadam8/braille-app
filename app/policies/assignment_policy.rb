class AssignmentPolicy < ApplicationPolicy
    attr_reader :user,:assignment

    def initialize(user,assignment)
        @user = user
        @assignment = assignment
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
        if @user.role.name == "Instructor" && @assignment.cohort.instructor == @user
          true
        end
    end

    def update?
      if @user.role.name == "Instructor" && @assignment.cohort.instructor == @user
        true
      end
    end

    def show?
      if (@user.role.name == "Instructor" && @user == @assignment.cohort.instructor) ||
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
      if @user.role.name == "Instructor" && @user == @assignment.cohort.instructor
        true
      end
    end

end
