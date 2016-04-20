class EmployeesController < ApplicationController

  include SessionsHelper
  before_action :authenticate!, only: [:profile]
  before_action :current_user, only: [:profile]

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.create employee_params
    redirect_to log_in_path
  end

  def log_in
  end

  def profile
    @employee = current_user
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :username, :email, :restaurant_location, :password, :password_confirmation)
  end



end
