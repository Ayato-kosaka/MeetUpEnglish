class UsersController < ApplicationController
  skip_before_action :require_Admin ,only: [:new, :create]

  def new
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:user).permit(:name, :man, :email, :password, :password_confirmation, :avatar)
    end
end
