require 'pry'
class CohortsController < ApplicationController

    def new
        @cohort = Cohort.new
        if !authorize @cohort
            redirect_to user_path(current_user)
        end
    end

    def create
        @cohort = Cohort.new(cohort_params)
        @cohort.user_id = current_user.id
        if @cohort.valid?
            @cohort.save
            redirect_to cohort_path(@cohort)
        else
            render :new
        end
    end

    private
    
    def cohort_params
        params.require(:cohort).permit(:title,:password)
    end
end