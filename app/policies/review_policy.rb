class ReviewPolicy < ApplicationPolicy
  attr_reader :user,:review

  def initialize(user,review)
    @user = user
    @review = review
    @paper = review.paper
    @assignment = @paper.assignment
  end

  def new?
    if @paper.assignment.cohort.students.include?(@user) && Paper.reviewed_by(@assignment,@user).empty? && !@paper.reviewed?
      true
    end
  end

  def create?
    if @paper.assignment.cohort.students.include?(@user) && Paper.reviewed_by(@assignment,@user).empty? && !@paper.reviewed?
      true
    end
  end

end
