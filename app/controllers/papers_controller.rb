require 'pry'
class PapersController < ApplicationController

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.assignment = Assignment.find(params[:assignment_id])
    @paper.user = current_user
    if @paper.valid?
      @paper.save
      redirect_to cohort_assignment_path(@paper.assignment.cohort, @paper.assignment)
    else
      render :new
    end
  end

  def show
  end

  private

  def paper_params
    params.require(:paper).permit(:title,:content)
  end

end
