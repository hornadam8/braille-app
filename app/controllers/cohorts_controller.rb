require 'pry'
class CohortsController < ApplicationController

    before_action :set_cohort, only: [:show,:edit,:update,:destroy]
    before_action :authorize!, only: [:show,:edit,:update,:destroy]
    before_action :check_user



    def new
      @cohort = Cohort.new
      authorize @cohort
    end

    def create
      @cohort = Cohort.new(cohort_params)
      @cohort.teacher = current_user
      if @cohort.valid?
        @cohort.save
        redirect_to cohort_path(@cohort)
      else
        error_messages(@cohort)
        render :new
      end
    end

    def show
      if current_user == @cohort.teacher
        @cohort.students.each do |s|
          @uc = s.user_cohorts.where(cohort_id: @cohort.id).first
        end
      end
    end

    def edit
    end

    def update
      if @cohort.update(title: params[:cohort][:title])
        redirect_to cohort_path(@cohort)
      else
        error_messages(@cohort)
        render :edit
      end
    end

    def index
      @cohorts = Cohort.all
    end

    def destroy
      @cohort.destroy
      redirect_to user_path(current_user)
    end

    private

    def cohort_params
      params.require(:cohort).permit(:title,:password)
    end

    def set_cohort
      @cohort = Cohort.find_by(id: params[:id])
    end

    def authorize!
      authorize @cohort
    end
end
