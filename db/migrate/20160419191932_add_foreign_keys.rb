class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :parties, :employees
    add_foreign_key :items, :parties
  end
end
