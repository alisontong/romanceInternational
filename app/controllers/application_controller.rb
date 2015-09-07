class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      if User.exists?(session[:user_id])
        @current_user ||= User.find(session[:user_id])
      else
        session[:user_id] = nil
      end
    end
  end
  
  helper_method :current_user

  def authorize
  	redirect_to login_path unless current_user
  end
end

