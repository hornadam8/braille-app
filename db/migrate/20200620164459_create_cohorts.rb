class CreateCohorts < ActiveRecord::Migration[6.0]
    def change
        create_table :cohorts do |t|
            t.string :title
            t.integer :user_id
            t.integer :instructor_id
        end
    end
end
