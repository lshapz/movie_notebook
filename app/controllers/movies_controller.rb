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
    @movie = Omdb.search(params[:movie][:title], params[:movie][:year])
    redirect_to movie_path(@movie)
    #else
     # render :new
    #end
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
  end 

  private

  def movie_params
    params[:movie].permit(:title, :director, :year, :link, :my_rating)
  end

    def set_movie!
    @movie = Movie.find(params[:id])
  end
end
