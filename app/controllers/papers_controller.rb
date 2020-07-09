require 'pry'
class PapersController < ApplicationController

  before_action :check_and_set_current_user
  before_action :set_paper, only: [:show,:edit,:update]
  before_action :authorize!, only: [:show,:edit,:update]


  def new
    @paper = Paper.new(assignment_id: params[:assignment_id],user_id: @user.id)
    authorize @paper
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.assignment = Assignment.find(params[:assignment_id])
    @paper.user_id = current_user.id
    @paper.author = current_user
    authorize @paper
    if @paper.valid?
      @paper.save
      redirect_to cohort_assignment_path(@paper.assignment.cohort, @paper.assignment)
    else
      error_messages(@paper)
      render :new
    end
  end

  def show
    @reviewer = User.find_by(id: @paper.reviewer_id)
    @review = Review.find_by(paper_id: @paper.id)
  end

  def edit
    @review = Review.find_by(paper_id: @paper.id)
  end

  def update
    if @paper.update(paper_params)
      @paper.update(edited?: true)
      redirect_to cohort_assignment_path(@paper.assignment.cohort,@paper.assignment)
    else
      error_messages(@paper)
      @review = Review.find_by(paper_id: @paper.id)
      render :edit
    end
  end

  private

  def authorize!
    authorize @paper
  end

  def set_paper
    @paper = Paper.find_by(id: params[:id])
  end

  def paper_params
    params.require(:paper).permit(:title,:content,:document)
  end

end
