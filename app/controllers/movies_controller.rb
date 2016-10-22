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
    @fake_dir = Director.find_or_create_by(name: "Alan Smithee")
    @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
    
    if !@movie.valid?
        render :new
    else
      @moviesearch = Omdb.search(params[:movie][:title], params[:movie][:year], params[:movie][:rating])
        if @moviesearch[:director_id] == nil
            @movie2 = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
            @movie2.save
            redirect_to movie_path(@movie2)
        else
            @movie = Movie.new(@moviesearch)
            byebug
            if !@movie.valid?
              render :new
            else
              @movie.save
              redirect_to movie_path(@movie)
            end
        end
     end
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
    params[:movie].permit(:title, :director_id, :year, :link, :rating)
  end

    def set_movie!
    @movie = Movie.find(params[:id])
  end
end
