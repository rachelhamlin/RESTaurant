class ItemsController < ApplicationController

  include SessionsHelper
  before_action :authenticate!
  before_action :current_user

  def index
    @employee = current_user
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
  end

  def show
    @employee = current_user
    @item = Item.find params[:id]
  end

  def new
    @employee = current_user
    @item = Item.new
  end

  def create
    item = Item.create item_params
    redirect_to items_path
  end

  def edit
    @employee = current_user
    @item = Item.find params[:id]
  end

  def update
    item = Item.find params[:id]
    item.update(item_params)
    redirect_to item_path
  end


  def destroy
    item = Item.find params[:id]
    item.destroy
    redirect_to items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category)
  end


end
