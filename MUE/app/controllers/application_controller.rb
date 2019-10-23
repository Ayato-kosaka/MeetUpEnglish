class ApplicationController < ActionController::Base
  before_action :require_Admin

  private

  def require_Admin
    unless session[:role] == "Admin"
      flash[:alert] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end

  def set_last_event_blog #only blog and home controller
    @latest_event_blog = Blog.where(blogcategory_id: 4).last
  end
end
