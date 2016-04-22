class OrdersController < ApplicationController

  def new
    @order = Order.new
    @party = Party.find params[:id]
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def create
    order_params.select{|item| item[:quantity] > 0}

    Order.create order_params

    # order_params is a hash - [{drink}, {drink}, {drink}]
    #select only the params where quantity is > 1
  end

  private

  def order_params
    params.require(:order).permit(:drinks => [:id, :quantity], :meals => [:id, :quantity], :desserts => [:id, :quantity])
  end

end
