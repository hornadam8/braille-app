require 'pry'
class AssignmentsController < ApplicationController
before_action :set_assignment, only: [:show,:edit,:update,:destroy]
before_action :authorize!, only: [:show,:edit,:update,:destroy]
before_action :check_user
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
      flash[:alert] = @assignment.errors.messages
      render :new
    end
  end

  def show
    @edit_ready_paper = Paper.edit_ready.find_by(author_id: current_user.id,assignment_id: @assignment.id)
    @completed_paper = Paper.completed.find_by(author_id: current_user.id,assignment_id: @assignment.id)
    @completed_papers = Paper.completed.where(assignment_id: @assignment.id)
    @reviewed_paper = Paper.edit_ready.find_by(reviewer_id: current_user.id,assignment_id: @assignment.id)
    @authored_paper = Paper.find_by(author_id: current_user.id,assignment_id: @assignment.id)
  end

  def edit
  end

  def update
    @assignment.update(title: params[:assignment][:title])
    redirect_to cohort_assignment_path(@assignment.cohort,@assignment)
  end

  def destroy
    @assignment.destroy
    redirect_to user_path(current_user)
  end


  private

  def authorize!
    authorize @assignment
  end

  def assignment_params
    params.require(:assignment).permit(:title)
  end

  def set_assignment
    @assignment = Assignment.find_by(id: params[:id])
  end

end
