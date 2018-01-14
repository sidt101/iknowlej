class SessionsController < ApplicationController

  skip_before_action :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present? && user.authenticate(params[:session][:password])
      login(user)
      remember(user)
      redirect_to(user)
    else
      flash.now[:danger] = 'Incorrect email address/password combination'
      render 'new'
    end
  end

  def destroy
    logout if logged_in?
    redirect_to(root_url)
  end
end
