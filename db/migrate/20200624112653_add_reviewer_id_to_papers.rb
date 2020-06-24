class AddReviewerIdToPapers < ActiveRecord::Migration[6.0]
  def change
    add_column :papers,:reviewer_id,:integer
  end
end
