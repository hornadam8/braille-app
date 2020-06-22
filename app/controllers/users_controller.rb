require 'pry'
class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :check_user

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
        @cohorts = Cohort.all
        binding.pry
    end



end