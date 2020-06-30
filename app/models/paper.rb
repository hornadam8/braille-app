class Paper < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :reviewer, class_name: "User"
  has_one :review, dependent: :delete
  belongs_to :assignment
  validates :title, presence: true
  validates :content, presence: true



  def self.edit_ready
    all.where(:reviewed? => true,:edited? => false)
  end

  def self.completed
    all.where(:reviewed? => true, :edited? => true)
  end

end
