require 'pry'
class PapersController < ApplicationController
before_action :set_paper, only: [:show,:edit,:update]
before_action :check_user

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
    @reviewer = User.find_by(id: @paper.reviewer_id)
    @review = Review.find_by(paper_id: @paper.id)
  end

  def edit
    authorize_paper
    @review = Review.find_by(paper_id: @paper.id)
  end

  def update
    authorize_paper
    if @paper.update(paper_params)
      @paper.update(edited?: true)
      redirect_to cohort_assignment_path(@paper.assignment.cohort,@paper.assignment)
    else
      set_paper
      @review = Review.find_by(paper_id: @paper.id)
      render :edit
    end
  end

  private

  def authorize_paper
    if !authorize @paper
      redirect_to logout_path
    end
  end

  def set_paper
    @paper = Paper.find_by(id: params[:id])
  end

  def paper_params
    params.require(:paper).permit(:title,:content)
  end

end
