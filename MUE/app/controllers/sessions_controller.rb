class SessionsController < ApplicationController
  skip_before_action :require_Admin ,only: [:new, :create]
  def new
  end

  def create
		if session[:user_id]
			reset_session
		end

		if (user = Admin.find_by(email: params[:email])) && user.authenticate(params[:password])
			session[:user] = user
			session[:role]  = "Admin"
			redirect_to contacts_url, notice: 'ログイン成功'
		elsif (user = Teacher.find_by(email: params[:email])) && user.authenticate(params[:password])
			session[:user_id] = user
			session[:role]  = "Teacher"
			redirect_to contacts_url, notice: 'ログイン成功'
		else
  		flash[:alert] = 'emailかpasswordに誤りがあります'
  		redirect_to login_url
    end
  end

  def destroy
		reset_session
		redirect_to login_url
  end
end
