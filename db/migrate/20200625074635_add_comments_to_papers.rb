class AddCommentsToPapers < ActiveRecord::Migration[6.0]

  def change
    add_column :papers,:comments,:text
  end

end
