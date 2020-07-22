require 'pry'
class CohortsController < ApplicationController

    before_action :check_and_set_current_user
    before_action :set_cohort, only: [:show,:edit,:update,:destroy]
    before_action :set_cohorts, oonly: [:index,:search]
    before_action :authorize!, only: [:show,:edit,:update,:destroy]




    def new
      @cohort = Cohort.new
      authorize @cohort
    end

    def create
      @cohort = Cohort.new(cohort_params)
      @cohort.instructor = current_user
      if @cohort.valid?
        @cohort.save
        redirect_to cohort_path(@cohort)
      else
        error_messages(@cohort)
        render :new
      end
    end

    def show
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

    end

    def destroy
      @cohort.destroy
      redirect_to user_path(current_user)
    end

    def search
      @cohort = Cohort.search(params[:q])
    end

    private

    def cohort_params
      params.require(:cohort).permit(:title,:password)
    end

    def set_cohorts
      @cohorts = Cohort.all
    end

    def set_cohort
      @cohort = Cohort.find_by(id: params[:id])
      if @user == @cohort.instructor
        @cohort.students.each do |s|
          @uc = s.user_cohorts.where(cohort_id: @cohort.id).first
        end
      end
    end

    def authorize!
      authorize @cohort
    end
end
