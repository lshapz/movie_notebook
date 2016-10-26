class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    render :show 
  end

  def edit
  end

private 
  def user_params
    params.require(:user).permit(:name, :password)
  end 

end
