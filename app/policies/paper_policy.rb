class PaperPolicy < ApplicationPolicy
  attr_reader :user,:paper

  def initialize(user,paper)
    @user = user
    @paper = paper
  end

  def new?
    if @paper.assignment.cohort.students.include?(@user) && !@paper.assignment.papers.detect{|p| p.author == @user}
      true
    end
  end

  def create?
    if @paper.assignment.cohort.students.include?(@user) && !@paper.assignment.papers.detect{|p| p.author == @user}
      true
    end
  end

  def show?
    if @paper.assignment.cohort.students.include?(@user) ||
      @paper.assignment.cohort.instructor == @user
      true
    end
  end

  def edit?
    if @paper.author == @user && @paper.reviewed? == true
      true
    end
  end

  def update?
    if @paper.author == @user && @paper.reviewed? == true
      true
    end
  end

end
