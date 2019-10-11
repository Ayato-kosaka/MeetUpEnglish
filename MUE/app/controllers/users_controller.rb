class UsersController < ApplicationController
  skip_before_action :require_Admin
  before_action :require_login_as_student
  layout 'student'



  private

    def require_login_as_student
      !current_user.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :man, :email, :password, :password_confirmation, :avatar)
    end
end
