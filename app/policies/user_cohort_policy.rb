class UserCohortPolicy < ApplicationPolicy

  def initialize(user,user_cohort)
    @user = user
    @user_cohort = user_cohort
  end


  def create?
    if @user.role.name == "Student" &&
      !@user.student_cohorts.include?(Cohort.find(@user_cohort.cohort_id)) &&
      Cohort.find(@user_cohort.cohort_id).teacher != @user
      true
    else
      return false
    end
  end
end
