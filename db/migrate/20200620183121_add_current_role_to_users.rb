class AddCurrentRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users,:current_role,:string
  end
end
