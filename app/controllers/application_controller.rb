class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  def current_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def homepage

    if session[:user_id]
      redirect_to plants_path
    else
      render '/homepage', :layout => false
    end
  end
end
