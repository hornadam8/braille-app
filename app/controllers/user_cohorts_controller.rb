require 'pry'
class UserCohortsController < ApplicationController
  before_action :check_user

  def new
    set_cohort
    @user_cohort = UserCohort.new
  end

  def create
    set_cohort
    @user_cohort = UserCohort.new(user_id: current_user.id, student_id: current_user.id, cohort_id: @cohort.id, student_cohort_id: @cohort.id)
    authorize @user_cohort
    if !!@cohort.authenticate(params[:user_cohort][:password])
      UserCohort.create(user_id: current_user.id, student_id: current_user.id, cohort_id: @cohort.id, student_cohort_id: @cohort.id)
      current_user.save
      redirect_to cohort_path(@cohort)
    else
      render :new
    end
  end


  private

  def set_cohort
    @cohort = Cohort.find_by(id: params[:cohort_id])
  end

end
