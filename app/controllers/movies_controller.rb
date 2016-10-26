require 'byebug'
class MoviesController < ApplicationController
  before_action :set_movie!, only: [:show, :edit, :update, :destroy]

  def index
    # byebug
    unalpha = Movie.all 
    @movies = unalpha.sort_by {|movie| movie.title}
  end

  def show 
    @opinion = UserMovie.find_by(movie_id: @movie.id, user_id: session[:user_id])

  end

  def new
    @movie = Movie.new
  end

  def create
    # byebug 
    new_movie = Omdb.newify(params["imdbID"])
    # takes user choice and actually gets movie info 
    @movie = Movie.new(new_movie)
    if @movie.save 
      # user stuff 
      @user = User.find(session[:user_id])
      @opinion = UserMovie.create(user_id: @user.id, movie_id: @movie.id, rating: params[:rating], year_seen: params[:year_seen], big_screen: params[:big_screen])
      redirect_to movie_path(@movie)
    else
      @choice = Choice.find_or_create_by(title: params["title"], year: params["year"], imdbID: params["imdbID"])
      @moviesearch = [@choice]
      render 'movies/new'
    end       
  end

  

  def edit
    @opinion = UserMovie.find_or_create_by(movie_id: @movie.id, user_id: session[:user_id])

  end

  def update
    @movie = Movie.find(params[:id]) #I don't think I need this with before_action 
    permits = params[:movie].permit(:title, :year, :rating, :director_id)
    permits[:director_id] = @movie.director_id
    
    # using this instead of movie_params because director_id vs director.name
    
    @movie.update(permits)

    if !@movie.valid?
      render :edit
    else
      director = Director.find_or_create_by(name: params[:movie][:director]) 
      params[:movie][:director_id] = director.id
      parameter = params[:movie].permit(:title, :year, :rating, :director_id)
      @movie.update(parameter)
      redirect_to movie_path(@movie)
    end
  end 

  def destroy
    @movies = Movie.all #do I need that or does it know from movies_url? 
    @movie.destroy
    redirect_to movies_url
  end


  private

  def movie_params
    params[:movie].permit(:title, :director_id, :year, :link, :director)
  end

  def set_movie!
    @movie = Movie.find(params[:id])
  end

end
