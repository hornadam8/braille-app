class CreateAssignments < ActiveRecord::Migration[6.0]

  def change
    create_table :assignments do |t|
      t.string :title
      t.integer :cohort_id
    end
  end
end
