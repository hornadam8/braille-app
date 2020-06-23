class Paper < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  validates :title, presence: true
  validates :content, presence: true
end
