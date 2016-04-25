class ChangePriceToDecimal < ActiveRecord::Migration
  def change
    def up
      change_column :items, :price, :integer
    end

    def down
      change_column :items, :price, :decimal
    end
  end
end
