require 'pry'
class UserRolesController < ApplicationController

  before_action :check_user

  def new
    @user_role = UserRole.new
  end

  def create
    role = Role.find_by(id: params[:user_role][:role_id])
    user_role = UserRole.find_or_create_by(user_id: @user.id, role_id: params[:user_role][:role_id])
    if user_role.valid?
      user_role.save
      @user.update!(current_role: role.name)
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
end
