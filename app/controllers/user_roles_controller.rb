require 'pry'
class UserRolesController < ApplicationController

    def new
        @user_role = UserRole.new
    end

    def create
        role = Role.find_by(id: params[:user_role][:role_id])
        user_role = UserRole.find_or_create_by(user_id: current_user.id, role_id: params[:user_role][:role_id])
        if user_role.valid?
            user_role.save
            current_user.update(current_role: role.name)
            redirect_to user_path(current_user)
        else
            render :new
        end
    end
end