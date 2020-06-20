class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to :set_role
        else
            render :new
        end
    end

    def new_role
    end

    def create_role
    end


    private

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

end