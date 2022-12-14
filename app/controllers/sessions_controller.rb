class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def login
    user = User.find_by(mail: params[:session][:mail].downcase)
    if user && (user.password == params[:session][:password])
      session[:user_id] = user.id
      if user.authority == 1
        redirect_to users_path
      else 
        redirect_to records_path
      end
    else
      render 'new'
    end
  end

  def create_user
    @user = User.new
    @user.password = params[:session][:password]
    @user.authority = 0
    @user.nickname = params[:session][:nickname]
    @user.level_id = params[:session][:level_id]
    @user.mail    = params[:session][:mail]

    if @user.save
      redirect_to login_path
    else
      render 'loginnew'
    end
  end
  
  def loginnew
    @levels = Level.all
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
