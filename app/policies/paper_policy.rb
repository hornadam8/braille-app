class PaperPolicy < ApplicationPolicy
  attr_reader :user,:paper

  def initialize(user,paper)
    @user = user
    @paper = paper
  end

  def show?
    if @paper.assignment.cohort.students.include?(@user) ||
      @paper.assignment.cohort.teacher == @user
      true
    end
  end

  def edit?
    if @paper.author == @user && @paper.reviewed? == true
      true
    else
      false
    end
  end

  def update?
    if @paper.author == @user && @paper.reviewed? == true
      true
    else
      false
    end
  end

end
