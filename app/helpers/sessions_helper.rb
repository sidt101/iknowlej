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
      @current_user ||= User.find(id: user_id_from_cookies.present)
      session[:user_id] = user_id_from_cookies
    end
  end

  def logged_in?
    current_user.present?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:user_token] = user.remember_token
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
  end
end
