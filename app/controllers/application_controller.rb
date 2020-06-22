class ApplicationController < ActionController::Base
    include Pundit
    private
    
    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def check_user
        if !session[:user_id]
            redirect_to root_path
        end
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end
end
