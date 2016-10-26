require 'byebug'
class UserMoviesController < ApplicationController

def edit
  @movie = Movie.find(params[:id])
    check_me = UserMovie.find_by(movie_id: @movie.id, user_id: session[:user_id])
    if !check_me
      @opinion = UserMovie.new(movie_id: @movie.id, user_id: current_user)
    else
      @opinion = check_me
    end 
#  byebug
  
  # render edit_movie_path(@movie.id)
end

def update
  @user_movie = UserMovie.find_or_create_by(movie_id: params[:movie], user_id: current_user)
  
  # byebug
  if @user_movie.update(rating: params[:rating], big_screen: params[:big_screen], year_seen: params[:year_seen])
    redirect_to movie_path(@user_movie.movie)
  else
    #byebug
    @opinion = @user_movie 
    @movie = Movie.find(params[:movie])
    render :edit
  end
end


end 