class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "logged_in"
    else
      render "new"
    end
  end

  def destroy
    #unset session id (log user out and send them to log in page)
    session[:user_id] = nil
    redirect_to "/sessions/new"
  end

  def new
  end
  
end
