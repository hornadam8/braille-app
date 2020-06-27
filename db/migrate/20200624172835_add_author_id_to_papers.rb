class AddAuthorIdToPapers < ActiveRecord::Migration[6.0]
  def change
    add_column :papers,:author_id,:integer
  end
end
