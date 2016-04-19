class RemoveFreakingPartyIdColumnPlease < ActiveRecord::Migration
  def change
    remove_reference(:items, :party, foreign_key:true)
  end
end
