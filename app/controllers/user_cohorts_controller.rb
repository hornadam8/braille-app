require 'pry'
class UserCohortsController < ApplicationController
  before_action :check_and_set_current_user

  def new
    set_cohort
    @user_cohort = UserCohort.new
  end

  def create
    set_cohort
    @user_cohort = UserCohort.new(user_id: @user.id, student_id: @user.id, cohort_id: @cohort.id, student_cohort_id: @cohort.id)
    authorize @user_cohort
    if !!@cohort.authenticate(params[:user_cohort][:password])
      UserCohort.create(user_id: @user.id, student_id: @user.id, cohort_id: @cohort.id, student_cohort_id: @cohort.id)
      @user.save
      redirect_to cohort_path(@cohort)
    else
      render :new
    end
  end

  def destroy
    @user_cohort = UserCohort.find_by(id: params[:id])
    @cohort = Cohort.find_by(id: @user_cohort.cohort_id)
    @user_cohort.destroy
    redirect_to cohort_path(@cohort)
  end


  private

  def set_cohort
    @cohort = Cohort.find_by(id: params[:cohort_id])
  end

end
