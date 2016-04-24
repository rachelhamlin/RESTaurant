class OrdersController < ApplicationController

  def new
    @order = Order.new
    @party = Party.find params[:id]
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
    @items = Order.joins(:item)
  end

  def create
    @party = Party.find params[:id]
    if @party[:status] == 1
      update_order(order_params[:drinks], params[:id], params[:party_id])
      @party.status = 2
      @party.save
    elsif @party[:status] == 2
      update_order(order_params[:meals], params[:id], params[:party_id])
      @party.status = 3
      @party.save
    elsif @party[:status] == 3
      update_order(order_params[:desserts], params[:id], params[:party_id])
      @party.status = 4
      @party.save
    end
    redirect_to order_path
  end

  private

  def update_order(foods_hash, id, party_id)
    foods_hash.each do |food_item|
      new_order = Hash.new
      if food_item["quantity"].to_i > 0
        @party = Party.find id
        new_order["party_id"] = party_id
        new_order["item_id"] = food_item[:id]
        new_order["quantity"] = food_item[:quantity]
        Order.create new_order
      end
    end
  end

  def order_params
    params.require(:order).permit(:id, :drinks => [:id, :quantity], :meals => [:id, :quantity], :desserts => [:id, :quantity])
  end

end
