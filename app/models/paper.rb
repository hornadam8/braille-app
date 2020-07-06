class Paper < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :reviewer, class_name: "User"
  has_one :review, dependent: :delete
  belongs_to :assignment
  validates :title, presence: true
  validates :content, presence: true



  def self.review_ready(assignment,user)
    if all.where(:assignment_id => assignment.id, :reviewed? => false, :edited? => false).select{|p| p.author != user}.present?
      all.where(:assignment_id => assignment.id, :reviewed? => false, :edited? => false).select{|p| p.author != user}.shuffle.first
    else
      nil
    end
  end

  def self.reviewed_by(assignment,user)
    all.where(:assignment_id => assignment.id, :reviewed? => true, :edited? => false,:reviewer_id => user.id)
  end

  def self.reviewed_for(assignment,user)
    all.where(:assignment_id => assignment.id, :reviewed? => true, :edited? => false,:author_id => user.id)
  end

  def self.completed(assignment)
    all.where(:assignment_id => assignment.id, :reviewed? => true, :edited? => true)
  end

end
