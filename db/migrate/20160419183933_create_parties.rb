class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.integer :number_of_people
      t.integer :table_number
      t.boolean :is_paid
      t.references :employee
      t.timestamps null: false
    end
  end
end
