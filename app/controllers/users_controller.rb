require 'pry'
class UsersController < ApplicationController

    before_action :check_user, only: [:show,:edit]
    before_action :set_user, only: [:show,:edit,:update,:destroy]
    layout :resolve_layout

    def new
        @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:alert] = user.errors.messages
        @user = User.new
        render :new
      end
    end

    def show
      if current_user.current_role == "Teacher"
        @teacher_cohorts = current_user.teacher_cohorts
      elsif current_user.current_role == "Student"
        @student_cohorts = current_user.student_cohorts
      end
      @cohorts = Cohort.all
    end

    def edit
      if !(@user == current_user)
        redirect_to logout_path
      end
    end

    def update
      @user.update(name: params[:user][:name])
      redirect_to user_path(@user)
    end

    def destroy
      @user.destroy
      redirect_to logout_path
    end

    def instructors
      @instructors = User.instructor
    end

    private

    def user_params
      params.require(:user).permit(:name,:email,:password,:current_role)
    end

    def resolve_layout
    case action_name
    when "new", "create"
      "home"
    else
      "application"
    end
  end



end
