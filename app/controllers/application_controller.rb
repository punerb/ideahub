class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user
  helper_method :user_signed_in?
  
  def is_admin?
    current_user.try(:is_admin) || invalid_url!
  end

  private  
  def current_user  
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]  
  end

  def user_signed_in?
    current_user 
  end

  def authenticate_user!
    unless current_user
      flash[:error] = 'You need to sign in before accessing this page!'
      redirect_to signin_path
    end
  end    

  def invalid_url!
    flash[:error] = 'Invalid URL !!!'
    redirect_to root_url and return
  end
end
