class PartiesController < ApplicationController

  include SessionsHelper
  before_action :authenticate!
  before_action :current_user

  def new
    @party = Party.new
  end

  def update
    @party = Party.find params[:id]
    @party.status = party_params[:status]
    @party.save
    redirect_to order_path
  end

  def create
    table_number = params[:party][:table_number].to_i
    if( Party.where(:table_number => table_number).length > 0)
      @error = "Someone is already seated there!"
      redirect_to new_party_path
    else
      new_party = Party.create party_params.merge({employee_id: current_user.id})
      redirect_to parties_path
    end
  end

  def current
    @parties = Party.where(employee_id: current_user.id)
                    .where(:is_paid => false)
  end

  def history
    @paidparties = current_user.only_paid

    Party.where(employee_id: current_user.id)
                        .where(:is_paid => true)
  end

  private

  def party_params
    params.require(:party).permit(:number_of_people, :table_number, :is_paid, :status)
  end

end
