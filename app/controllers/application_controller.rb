class ApplicationController < ActionController::Base
  private

    def logged_in
        unless current_user
            flash[:notice] = "Sign up or Sign in to see events"
            redirect_to login_path            
        end
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
