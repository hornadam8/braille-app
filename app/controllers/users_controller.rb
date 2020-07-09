require 'pry'
class UsersController < ApplicationController

    before_action :check_and_set_current_user, only: [:show,:edit]
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
      if @user.role.name == "Instructor"
        @instructor_cohorts = @user.instructor_cohorts
      elsif @user.role.name == "Student"
        @student_cohorts = @user.student_cohorts
      end
      @cohorts = Cohort.all
    end

    def edit
      if !(@user == @user)
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
      params.require(:user).permit(:name,:email,:password,:role_id)
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
