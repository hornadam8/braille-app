class PaperPolicy < ApplicationPolicy
  attr_reader :user,:paper

  def initialize(user,paper)
    @user = user
    @paper = paper
  end

  def edit?
    if @paper.author == @user && @paper.reviewed? == true
      true
    else
      false
    end
  end

end
