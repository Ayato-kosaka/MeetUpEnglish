class SessionsController < ApplicationController
  skip_before_action :require_Admin
  def new
  end

  def create
    log_out if logged_in?

		if (user = Teacher.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
			redirect_to root_url
		else
  		flash.now[:alert] = '*emailかpasswordに誤りがあります'
  		render 'new'
    end
  end

  def destroy
    log_out if logged_in?
		redirect_to root_url
  end
end
