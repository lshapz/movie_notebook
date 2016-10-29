class UsersController < ApplicationController
  before_action :require_logged_in
  skip_before_action :require_logged_in, only: [:new, :create]

  def index
    redirect_to movies_path
  end

  def show
    @user = User.find(current_user)
    history = UserMovie.where(user_id: @user.id)
    @seen = history.each_with_object([]) do |movie, seen|
        seen << movie
    end
    sql_feelings = UserMovie.find_by_sql("select rating, count(*) as count from user_movies where user_id = #{@user.id} group by rating")
    @feelings =    sql_feelings.map do |feeling|
      [feeling.rating, feeling.count]
    end
    # @feelings.to_h

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
