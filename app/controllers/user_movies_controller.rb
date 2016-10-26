class UserMoviesController < ApplicationController

def edit
  @user_movie = UserMovie.find_or_create_by(movie_id: @movie.id, user_id: session[:user_id])
end

def update
  @user_movie = UserMovie.find_or_create_by(movie_id: params[:movie], user_id: current_user)
  @user_movie.update(rating: params[:rating], big_screen: params[:big_screen], year_seen: params[:year_seen])
  byebug
  redirect_to '/movies'
end


end 