class CreatePapers < ActiveRecord::Migration[6.0]

  def change
    create_table :papers do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :assignment_id
    end
  end

end
