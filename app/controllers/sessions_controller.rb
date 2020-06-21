class SessionsController < ApplicationController

    def new
    end

    def create
    end

    def logout
        session.clear
        redirect_to "/"
    end
    
end