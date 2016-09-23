class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :authenticate_user!, only: [:create, :update, :destroy, :new, :edit]
#  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
#  rescue_from ActionController::RoutingError, with:  :record_not_found
#  rescue_from Exception, with: :record_not_found
 

  def current_user
#    if session[:user_id]
#      if User.exists?(session[:user_id])
#        @current_user= User.find(session[:user_id])
#      end
#    end
    if cookies[:auth_token]
      @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if User.find_by_auth_token(cookies[:auth_token])
    end
  end
    
  def record_not_found
    #render plain: "404 Not Found", status: 404
    redirect_to root_path, notice: '404 Not Found'
  end

  private
    def user_not_authorized
      if request.xhr?
        render json: {msg: "You don't have permission to do it"}, status: 403            
      else
        redirect_to root_path, notice: 'you are not allowed to do it'
      end
    end

    def authenticate_user!
      unless current_user
        if request.path == '/sign_up' 
        elsif request.path == '/log_in'
        else
      redirect_to root_path, notice: 'You must be logged to do it'
        end
      end
    end
 
end
