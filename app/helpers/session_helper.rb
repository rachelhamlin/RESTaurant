module SessionHelper

  def authenticate!
    redirect_to log_in_path unless current_user
  end

  def current_user
    @current_user = Employee.find session[:employee_id] if session[:employee_id]
  end

end
