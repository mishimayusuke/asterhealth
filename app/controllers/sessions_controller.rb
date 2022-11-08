class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail: params[:session][:email].downcase)
    if user && (user.password == params[:session][:password])
      session[:user_id] = user.id
      if user.authority == 1
        redirect_to users_path
      else 
        redirect_to home_top_path
      end
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
