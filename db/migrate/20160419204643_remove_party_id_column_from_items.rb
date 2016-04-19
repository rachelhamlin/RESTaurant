class RemovePartyIdColumnFromItems < ActiveRecord::Migration
  def down
    remove_column :items, :party_id
  end
end
