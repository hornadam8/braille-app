require 'pry'
class CohortsController < ApplicationController
    before_action :set_cohort, only: [:show,:edit,:update]
    before_action :check_user
    before_action :authorize!, only: [:show]


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
            @errors = @cohort.errors.messages
            render :new
        end
    end

    def show
      current_user
    end

    def edit
    end

    def update
      @cohort.update(title: params[:cohort][:title])
      redirect_to cohort_path(@cohort)
    end

    def index
      authorize Cohort
      @cohorts = Cohort.all
    end

    private

    def cohort_params
        params.require(:cohort).permit(:title,:password)
    end

    def set_cohort
        @cohort = Cohort.find_by(id: params[:id])
    end

    def authorize!
      if !authorize @cohort
        redirect_to logout_path
      end
    end
end
