class UsersController < ApplicationController
  before_action :require_login_as_student
  layout 'student'



  private

    def require_login_as_student
      if current_user.nil?
        flash[:alert] = "You must be Student in to access this section"
        redirect_to login_url if current_user.nil?
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :man, :email, :password, :password_confirmation, :avatar)
    end
end
