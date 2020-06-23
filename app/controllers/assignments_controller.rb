require 'pry'
class AssignmentsController < ApplicationController

  def new
    @cohort = Cohort.find_by(id: params[:cohort_id])
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.cohort_id = params[:cohort_id]
    if @assignment.valid?
      @assignment.save
      @cohort = @assignment.cohort
      redirect_to cohort_assignment_path(@cohort,@assignment)
    else
      render :new
    end
  end

  def show
  end


  private

  def assignment_params
    params.require(:assignment).permit(:title)
  end

end