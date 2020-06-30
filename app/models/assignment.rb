class Assignment < ApplicationRecord
  belongs_to :cohort
  has_many :papers, dependent: :delete_all
  has_many :students, class_name: "User", through: :papers
  validates :title, presence: true
end
