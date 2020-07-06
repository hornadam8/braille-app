class ReviewsController < ApplicationController

  before_action :check_user

  def new
    @paper = Paper.find_by(id: params[:paper_id])
    @review = Review.new(paper_id: @paper.id)
    authorize @review

  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.paper_id = params[:paper_id]
    authorize @review
    if @review && @review.valid?
      @review.save
      @paper = Paper.find_by(id: params[:paper_id])
      @paper.update(reviewed?: true, reviewer_id: current_user.id)
      redirect_to cohort_assignment_path(@paper.assignment.cohort,@paper.assignment)
    else
      flash[:alert] = @review.errors.messages
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
