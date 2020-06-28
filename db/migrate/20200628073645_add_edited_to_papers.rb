class AddEditedToPapers < ActiveRecord::Migration[6.0]

  def change
    add_column :papers,:edited?,:boolean,:default => false
  end

end
