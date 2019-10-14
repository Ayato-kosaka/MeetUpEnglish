class ApplicationController < ActionController::Base
  before_action :require_Admin #comment out in production
  include SessionsHelper
  include ApplicationHelper




  private

  def require_Admin #Erase later , this method restricts acsess to all CtoC page
    unless admin?
      flash[:alert] = "You must be Admin in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
