class AddPartyStatus < ActiveRecord::Migration
  def change
    add_column :parties, :status, :integer, :default => 1
  end
end
