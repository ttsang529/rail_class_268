class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])

    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        #logger.info("session info" + session[:user_id].to_s)
        redirect_to root_path
    else
        redirect_to login_path
    end

  end

  def destroy
      session[:user_id] = nil
      redirect_to root_path
  end

end