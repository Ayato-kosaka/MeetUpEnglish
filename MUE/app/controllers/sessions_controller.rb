class SessionsController < ApplicationController
  skip_before_action :require_Admin
  layout 'simple'


  def set_locale
      I18n.locale = locale
  end
  def locale
      @locale ||= params[:locale] ||= I18n.default_locale
  end
  def default_url_options(options={})
      options.merge(locale: locale)
  end





  #logout_path 	DELETE 	/logout(.:format) 	sessions#destroy
  def destroy
    log_out if logged_in?
		redirect_to root_url
  end
end
