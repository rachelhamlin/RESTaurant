class ItemsController < ApplicationController

  def index
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def show
    @item = Item.find params[:id]
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create item_params
    redirect_to '/admin'
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category)
  end


end
