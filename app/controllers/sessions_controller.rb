require 'pry'
class SessionsController < ApplicationController
layout "home"

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if  @user.valid? && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            @user = User.new
            render :"sessions/new"
        end
    end

    def logout
        session.clear
        redirect_to root_path
    end

    def googleAuth
      # Get access tokens from the google server
      access_token = request.env["omniauth.auth"]
      @user = User.from_omniauth(access_token)

      session[:user_id] = @user.id
      # Access_token is used to authenticate request made from the rails application to the google server
      @user.google_token = access_token.credentials.token
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
      refresh_token = access_token.credentials.refresh_token
      @user.google_refresh_token = refresh_token if refresh_token.present?
      @user.save
      if @user.current_role.nil?
        @user.current_role == "Student"
      end
      redirect_to user_path(@user)
    end

end
