class ApplicationController < ActionController::Base
    private
    
    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
