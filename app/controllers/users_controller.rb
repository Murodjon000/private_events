class UsersController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in
=======
>>>>>>> e81048bcc2b7ce2094d0869f732343ea715a3dfe
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You successfuly signed up'
      redirect_to @user
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end