class ApplicationController < ActionController::Base
  before_action :require_Admin #comment out in production
  include SessionsHelper




  private

  def require_Admin #Erase later , this method restricts acsess to all CtoC page
    current_user unless @current_user
    current_teacher unless @current_teacher

    logger.debug("-------------#{@current_teacher.name}----------")
    unless session[:role] == "Admin" || @current_user&.admin || @current_teacher&.admin
      flash[:alert] = "You must be Admin in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
