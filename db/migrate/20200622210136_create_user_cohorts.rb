class CreateUserCohorts < ActiveRecord::Migration[6.0]

    def change
        create_table :user_cohorts do |t|
            t.integer :user_id
            t.integer :student_id
            t.integer :cohort_id
            t.integer :student_cohort_id
        end
    end
end
