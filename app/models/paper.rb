class Paper < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_one :reviewer, class_name: "User"
  belongs_to :assignment
  validates :title, presence: true
  validates :content, presence: true



  def self.completed
    all.where(:reviewed? => true)
  end

end
