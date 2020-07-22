class ApplicationController < ActionController::Base

    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    private

    def current_user
        @user = User.find_by(id: session[:user_id])
    end

    def user_params
        params.require(:user).permit(:name,:email,:password)
    end

    def check_and_set_current_user
      if !session[:user_id]
        redirect_to root_path
      else
        @user = current_user
      end
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def error_messages(obj)
      obj.errors.messages.each do |k,v|
        flash[:alert] = "#{k.to_s} #{v.first.to_s}"
      end
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || user_path(@user))
    end
end
