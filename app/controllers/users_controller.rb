require 'pry'
class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :check_user, only: [:show]
    layout :resolve_layout

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if  user.valid?
                user.save
            session[:user_id] = user.id
            redirect_to new_user_role_path
        else
            @user = User.new
            render :new
        end
    end

    def show
        if current_user.current_role == "Teacher"
            @teacher_cohorts = current_user.teacher_cohorts
        end
        @cohorts = Cohort.all
    end

    private

    def resolve_layout
    case action_name
    when "new", "create"
      "home"
    else
      "application"
    end
  end



end
