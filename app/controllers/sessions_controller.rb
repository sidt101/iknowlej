class SessionsController < ApplicationController

  skip_before_action :require_login

  def new
    #render login form
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user.present? && user.authenticate(session_params[:password])
      login(user)
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

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
