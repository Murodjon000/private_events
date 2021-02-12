class SessionsController < ApplicationController
  def new
    # new
  end

  def create
    user = User.find_by(name: params[:name])

    if user
      session[:user_id] = user.id
      redirect_to root_path
      flash[:success] = 'You successfuly logged in'
    else
      render :new
      flash[:alert] = 'Name is invalid'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = 'You successfuly logged out'
  end
end
