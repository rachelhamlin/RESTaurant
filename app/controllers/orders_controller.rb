class OrdersController < ApplicationController

  def new
    @order = Order.new
    @party = Party.find params[:id]
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def create
    order_params.collect {|item| item[:quantity].to_i > 0}

    Order.create order_params
  end

  private

  def order_params
    params.require(:order).permit(:drinks => [:id, :quantity], :meals => [:id, :quantity], :desserts => [:id, :quantity])
  end

end
