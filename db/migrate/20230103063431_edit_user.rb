class EditUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role, :integer
    remove_column :users, :arrived_date, :datetime
    remove_column :users, :leaved_date, :datetime
    remove_column :users, :permissions, :boolean
  end
end
