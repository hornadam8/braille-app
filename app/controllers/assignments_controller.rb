require 'pry'
class AssignmentsController < ApplicationController

  before_action :check_user
  before_action :set_assignment, only: [:show,:edit,:update,:destroy]
  before_action :authorize!, only: [:show,:edit,:update,:destroy]


  def new
    @cohort = Cohort.find_by(id: params[:cohort_id])
    @assignment = Assignment.new
    authorize @assignment
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.cohort_id = params[:cohort_id]
    if @assignment.valid?
      @assignment.save
      @cohort = @assignment.cohort
      redirect_to cohort_assignment_path(@cohort,@assignment)
    else
      error_messages(@assignment)
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @assignment.update(title: params[:assignment][:title])
      redirect_to cohort_assignment_path(@assignment.cohort,@assignment)
    else
      error_messages(@assignment)
      render :edit
    end
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
    @cohort = @assignment.cohort
    edit_ready_papers =  Paper.edit_ready(@assignment).select{|p| p.author != @user}
    if edit_ready_papers.present?
      @edit_ready_paper = edit_ready_papers.shuffle.first
    end
    @completed_paper = Paper.completed(@assignment).find_by(author_id: @user.id)
    @completed_papers = Paper.completed(@assignment)
    @reviewed_paper = Paper.edit_ready(@assignment).find_by(author_id: @user.id)
    @authored_paper = Paper.find_by(author_id: @user.id,assignment_id: @assignment.id)
  end

end
