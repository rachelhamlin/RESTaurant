class AddForeignKeytoOrder < ActiveRecord::Migration
  def change
    add_foreign_key :orders, :items
    add_foreign_key :orders, :parties
  end
end
