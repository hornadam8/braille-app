class Assignment < ApplicationRecord
  belongs_to :cohort
  has_many :papers
  has_many :students, class_name: "User", through: :papers
  validates :title, presence: true
end
