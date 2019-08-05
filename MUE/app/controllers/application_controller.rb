class ApplicationController < ActionController::Base
  before_action :require_Admin

  private

  def require_Admin
  end
end
