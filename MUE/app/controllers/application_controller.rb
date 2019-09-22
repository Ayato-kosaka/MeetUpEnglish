class ApplicationController < ActionController::Base
  before_action :require_Admin
  include SessionsHelper

  private

  def require_Admin
    unless session[:role] == "Admin"
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
