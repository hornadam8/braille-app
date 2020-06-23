class SessionsController < ApplicationController
layout "home"

    def new
        @user = User.new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if  user.valid? && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to new_user_role_path
        else
            @user = User.new
            render :"sessions/new"
        end
    end

    def logout
        session.clear
        redirect_to "/"
    end

end
