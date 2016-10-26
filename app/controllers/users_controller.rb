class UsersController < ApplicationController
    before_action :require_logged_in
    skip_before_action :require_logged_in, only: [:new, :create]

  def index
    redirect_to movies_path
  end

  def show
    @user = User.find(current_user)
    @seen = []
    @seen << UserMovie.find_by(user_id: @user.id)
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
