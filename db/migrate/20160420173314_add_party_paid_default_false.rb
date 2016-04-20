class AddPartyPaidDefaultFalse < ActiveRecord::Migration
  def change
    change_column :parties, :is_paid, :boolean, :default => false
  end
end
