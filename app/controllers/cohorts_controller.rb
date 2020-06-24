require 'pry'
class CohortsController < ApplicationController
    before_action :set_cohort
    before_action :check_user
    before_action :authorize!, only: [:new,:create,:show]


    def new
    end

    def create
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
      case action_name
      when "show"
        @cohort = Cohort.find_by(id: params[:id])
      when "new"
        @cohort = Cohort.new
      when "create"
        @cohort = Cohort.new(cohort_params)
      when "index"
        @cohorts = Cohort.all
      end
    end

    def authorize!
      authorize @cohort
    end
end
