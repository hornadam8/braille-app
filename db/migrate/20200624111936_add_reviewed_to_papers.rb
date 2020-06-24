class AddReviewedToPapers < ActiveRecord::Migration[6.0]

  def change
    add_column :papers,:reviewed?,:boolean,:default => false
  end

end
