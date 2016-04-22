class Order < ActiveRecord::Base
  belongs_to :party
  belongs_to :item

  def party_status
    party = Party.find params[:id]
    status = party.status
    if @status == 1
      render :drinks
    elsif @status == 2
      render :meals
    elsif @status == 3
      render :desserts
    end
  end


end
