require 'pry'
class UserRolesController < ApplicationController

    def new
        @user_role = UserRole.new(user_id: session[:user_id])
        @roles = Role.all
    end

    def create
        user_role = UserRole.new(user_id: current_user.id, role_id: params[:user_role][:role_id])
        if user_role.valid?
            user_role.save
            role_name = Role.find_by(params[:user_role][:role_id]).name
            current_user.update(current_role: role_name)
            @user = current_user
            redirect_to user_path(@user)
        else
            render :new
        end
    end
end