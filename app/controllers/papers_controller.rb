require 'pry'
class PapersController < ApplicationController
before_action :set_paper, only: [:show]

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.assignment = Assignment.find(params[:assignment_id])
    @paper.user_id = current_user.id
    @paper.author = current_user
    if @paper.valid?
      @paper.save
      redirect_to cohort_assignment_path(@paper.assignment.cohort, @paper.assignment)
    else
      @errors = @paper.errors.messages
      render :new
    end
  end

  def show
  end

  private

  def set_paper
    @paper = Paper.find_by(id: params[:id])
  end

  def paper_params
    params.require(:paper).permit(:title,:content)
  end

end
