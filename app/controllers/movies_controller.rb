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
    #byebug
    @movie = Movie.find(params[:id])
    permits = params[:movie].permit(:title, :year, :rating, :director_id)
    permits[:director_id] = @movie.director_id
    @movie2 = Movie.new(permits)
    #@movie2 = Movie.new(movie_params)
    #byebug
     if !@movie2.valid?
        @movie = Movie.find(params[:id])
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
    @movies = Movie.all
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
