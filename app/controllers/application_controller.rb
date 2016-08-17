class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_product

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

#  def current_product
#    @current_product = Product.find(params[:id])
#  end


end
