class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if  user.valid? && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to edit_user_role_path
        else
            render :new
        end
    end

    def logout
        session.clear
        redirect_to "/"
    end
    
end