class ApplicationController < ActionController::Base
  helper_method :authenticated
  helper_method :logged_in?
 
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !current_user.nil?
    end
   
    def authenticated
      redirect_to login_path unless logged_in?
    end

      
end
