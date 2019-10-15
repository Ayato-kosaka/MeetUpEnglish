module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user, stu)
    session[:user_id] = user.id
    stu ? (session[:student] = true) : (session[:teacher] = true)
  end

  # ユーザーのセッションを永続的にする
  def remember(user, stu)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    stu ? (cookies.permanent[:student] = true) : (cookies.permanent[:teacher] = true)
  end

  # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end
  def current_teacher?(user)
    user == current_teacher
  end

  # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    if ((user_id = session[:user_id]) && session[:student] )#Is session[:user_id] exsist?
      @current_user ||= User.find_by(id: user_id)
    elsif ((user_id = cookies.signed[:user_id]) && cookies[:student])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user,true)
        @current_user = user
      end
    end
  end
  def current_teacher
    if ((user_id = session[:user_id]) && session[:teacher])
      @current_teacher ||= Teacher.find_by(id: user_id)
    elsif ((user_id = cookies.signed[:user_id]) && cookies[:teacher])
      user = Teacher.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user,false)
        @current_teacher = user
      end
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil? || !current_teacher.nil?
  end


  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # 現在のユーザーをログアウトする
  def log_out
    forget(current_user || current_teacher)
    reset_session
    @current_user = nil
    @current_teacher = nil
  end

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
