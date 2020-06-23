require 'pry'
class CohortsController < ApplicationController
    before_action :set_cohort, only: [:show]
    before_action :check_user


    def new
        @cohort = Cohort.new
        if !authorize @cohort
            redirect_to user_path(current_user)
        end
    end

    def create
        @cohort = Cohort.new(cohort_params)
        @cohort.teacher = current_user
        current_user.teacher_cohorts << @cohort
        current_user.save
        if @cohort.valid?
            @cohort.save
            redirect_to cohort_path(@cohort)
        else
            render :new
        end
    end

    def show
      current_user
    end

    def index
      @cohorts = Cohort.all
    end

    private

    def cohort_params
        params.require(:cohort).permit(:title,:password)
    end

    def set_cohort
        @cohort = Cohort.find_by(id: params[:id])
    end
end
