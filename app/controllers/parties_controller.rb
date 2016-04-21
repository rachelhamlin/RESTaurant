class PartiesController < ApplicationController

  include SessionsHelper
  before_action :authenticate!
  before_action :current_user

  def new
    @party = Party.new
  end

  def create
    new_party = Party.create party_params.merge({employee_id: current_user.id})
    redirect_to parties_path
  end

  def current
    @parties = Party.where(employee_id: current_user.id)
                    .where(:is_paid => false)
  end

  def order
    @drinks = Item.where(category: 'drinks')
    @meals = Item.where(category: 'meals')
    @desserts = Item.where(category: 'desserts')
    @party = Party.find params[:id]
  end


  def history
    @paidparties = Party.where(employee_id: current_user.id)
                        .where(:is_paid => true)
  end

  private

  def party_params
    params.require(:party).permit(:number_of_people, :table_number, :is_paid)
  end

end
