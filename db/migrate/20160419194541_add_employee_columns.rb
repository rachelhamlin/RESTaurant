class AddEmployeeColumns < ActiveRecord::Migration
  def change
    add_column :employees, :username, :string, :null => false
    add_column :employees, :password_digest, :string, :null => false
  end
end
