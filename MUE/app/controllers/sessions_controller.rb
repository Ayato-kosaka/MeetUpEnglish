class SessionsController < ApplicationController
  skip_before_action :require_Admin
  layout 'simple'




  



  #logout_path 	DELETE 	/logout(.:format) 	sessions#destroy
  def destroy
    log_out if logged_in?
		redirect_to root_url
  end
end
