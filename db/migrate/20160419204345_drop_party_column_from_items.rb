class DropPartyColumnFromItems < ActiveRecord::Migration
  def down
    remove_column :items, :party
  end
end
