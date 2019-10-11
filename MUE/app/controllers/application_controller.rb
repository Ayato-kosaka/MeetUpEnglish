class ApplicationController < ActionController::Base
  before_action :require_Admin
  include SessionsHelper

  def set_locale
      I18n.locale = locale
  end
  def locale
      @locale ||= params[:locale] ||= I18n.default_locale
  end
  def default_url_options(options={})
      options.merge(locale: locale)
  end

  private

  def require_Admin
    unless session[:role] == "Admin"
      flash[:alert] = "You must be Admin in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
