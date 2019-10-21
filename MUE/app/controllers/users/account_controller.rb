class Users::AccountController < UsersController
  before_action :at_account

  def index
    current_user
  end

  private
    def at_account
      @at = "account"
    end
end
