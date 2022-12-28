class AddBasicColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :gender, :string
    add_column :users, :role, :integer
    add_column :users, :arrived_date, :datetime
    add_column :users, :leaved_date, :datetime
    add_column :users, :permissions, :boolean
  end
end
