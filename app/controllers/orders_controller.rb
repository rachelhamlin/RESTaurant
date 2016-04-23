class OrdersController < ApplicationController

  def new
    @order = Order.new
    @party = Party.find params[:id]
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def create
    @party = Party.find params[:id]
    if @party[:status] == 1
      @party.drinks.each do |drink|
        new_order = Hash.new
        if drink["quantity"].to_i > 0
          @party = Party.find id
          new_order["party_id"] = party_id
          new_order["item_id"] = drink[:id]
          new_order["quantity"] = drink[:quantity]
          Order.create new_order
        end
      end
      @party.status = 2
      @party.save
    elsif @party[:status] == 2
      @meals.each do |meal|
        new_order = Hash.new
        if meal["quantity"].to_i > 0
          @party = Party.find id
          new_order["party_id"] = party_id
          new_order["item_id"] = meal[:id]
          new_order["quantity"] = meal[:quantity]
          Order.create new_order
        end
      end
      @party.status = 3
      @party.save
    elsif @party[:status] == 3
      @desserts.each do |dessert|
        new_order = Hash.new
        if dessert["quantity"].to_i > 0
          @party = Party.find id
          new_order["party_id"] = party_id
          new_order["item_id"] = dessert[:id]
          new_order["quantity"] = dessert[:quantity]
          Order.create new_order
        end
      end
      @party.status = 4
      @party.save
    end
    redirect_to order_path
  end

  private

  # def update_order(foods_hash, id, party_id)
  #   foods_hash.each do |food_item|
  #     new_order = Hash.new
  #     if food_item["quantity"].to_i > 0
  #       @party = Party.find id
  #       new_order["party_id"] = party_id
  #       new_order["item_id"] = food_item[:id]
  #       new_order["quantity"] = food_item[:quantity]
  #       Order.create new_order
  #     end
  #   end
  # end

  def order_params
    params.require(:order).permit(:id, :drinks => [:id, :quantity], :meals => [:id, :quantity], :desserts => [:id, :quantity])
  end

end
