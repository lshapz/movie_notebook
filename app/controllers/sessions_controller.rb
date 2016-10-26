class SessionsController < ApplicationController
 
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:login, :new, :create]
 

  def show
  end

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    user = user.try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      @user = user
      redirect_to (user_path(@user))
    else
       redirect_to('/sessions/new')
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/movies'
  end

end
