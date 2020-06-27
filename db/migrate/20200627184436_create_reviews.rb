class CreateReviews < ActiveRecord::Migration[6.0]

  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :paper_id
    end
  end

end
