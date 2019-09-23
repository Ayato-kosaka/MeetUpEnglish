class SessionsController < ApplicationController
  skip_before_action :require_Admin ,only: [:new, :create]
  def new
  end

  def create
		if session[:user_id]
			reset_session
		end

		if (user = Admin.find_by(email: params[:session][:email])) && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to contacts_url, notice: 'ログイン成功'
		elsif (user = Teacher.find_by(email: params[:session][:email].downcase)) && user.authenticate(params[:session][:password])
			log_in(user)
			redirect_to root_url
		else
  		flash.now[:alert] = 'emailかpasswordに誤りがあります'
  		render 'new'
    end
  end

  def destroy
    logger.debug("\n\n\n\n\n\n\n\nif文の中に入りました")
    log_out
		redirect_to root_url
  end
end
