class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :gui_number, null: false
      t.string :principal, null: false
      t.string :address, null: false

      t.timestamps
    end

    add_index :companies, :gui_number, unique: true
  end
end
