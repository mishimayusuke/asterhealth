class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(mail: params[:session][:email].downcase)
    if user && (user.password == params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
