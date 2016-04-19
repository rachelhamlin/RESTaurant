class AddEmailColumntoEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string, :null => false
  end
end
