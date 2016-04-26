class SessionsController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]

    user = Employee.find_by username: username

    if user && user.authenticate(password)
      session[:employee_id] = user.id
      redirect_to profile_path
    else
      redirect_to log_in_path
    end
  end

  def destroy
    session[:employee_id] = nil
    redirect_to log_in_path
  end

end
