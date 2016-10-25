require 'byebug'
class MoviesController < ApplicationController
  before_action :set_movie!, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
      @moviesearch = Omdb.search(params[:movie][:title])
      # uses search API to give user selection options
      render 'choices/new'
  end

  def edit
  
  end

  def update
    @movie = Movie.find(params[:id])
    permits = params[:movie].permit(:title, :year, :rating, :director_id)
    permits[:director_id] = @movie.director_id
    # using this instead of movie_params because director_id vs director.name
    @movie.update(permits)

    if !@movie.valid?
      render :edit
    else
      dir = Director.find_or_create_by(name: params[:movie][:director]) 
      params[:movie][:director_id] = dir.id
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
    params[:movie].permit(:title, :director_id, :year, :link, :rating, :director)
  end

  def set_movie!
    @movie = Movie.find(params[:id])
  end

end
