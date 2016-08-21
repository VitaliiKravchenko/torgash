class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    if params[:provider] == "facebook"
      user = User.from_omniauth(env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to root_path
    else
      user = User.authenticate(params[:email], params[:password])
        if user
          session[:user_id] = user.id
          redirect_to root_url, :notice => "Logged in!"
        else
          flash.now.alert = "Invalid email or password"
          render "new"
        end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
