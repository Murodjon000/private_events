class ApplicationController < ActionController::Base
  private

  def logged_in
    # rubocop:disable Style/GuardClause
    unless current_user
      flash[:notice] = 'Sign up or Sign in to see events'
      redirect_to login_path
    end
    # rubocop:enable Style/GuardClause
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
