class Assignment < ApplicationRecord
  belongs_to :cohort
  validates :title, presence: true
end
