class Users::AccountController < UsersController
  before_action :at_account

  def index

  end

  private
    def at_account
      session[:at] = "account"
    end
end
