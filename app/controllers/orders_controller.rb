class OrdersController < ApplicationController

  def new
    @order = Order.new
    @party = Party.find params[:id]
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def create
    params = order_params

    new_order = Order.create order_params
  end

  private

  def order_params
    params.require(:order).permit(:party_id, :item_id)
    params.require(:order).permit(:drinks)
  end

end
