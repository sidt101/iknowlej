module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def current_user
    user_id_from_session ||= session[:user_id]
    user_id_from_cookies ||= cookies.permanent.signed[:user_id]
    if user_id_from_session.present?
      @current_user ||= User.find_by(id: user_id_from_session)
    elsif user_id_from_cookies.present?
      user = User.find_by(id: user_id_from_cookies)
      if user.present? && user.authenticated?(cookies[:remember_token])
        login(user)
        @current_user ||= User.find_by(id: user_id_from_cookies)
      end
    end
  end

  def logged_in?
    current_user.present?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def logout
    forget(current_user)
    session[:user_id] = nil
    @current_user = nil
  end

  private

  def require_login
    unless logged_in?
      redirect_to login_url
    end
  end
end
