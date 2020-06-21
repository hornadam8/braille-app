class AddPasswordToCohorts < ActiveRecord::Migration[6.0]
    def change
        add_column :cohorts,:password_digest,:string
    end
end