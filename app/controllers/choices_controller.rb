class ChoicesController < ApplicationController
  def new

  end

  def create
    
    new_movie = Omdb.newify(params["imdbID"], params["rating"])
    @movie = Movie.new(new_movie)
    @movie.save 
    redirect_to movie_path(@movie)
  end 

private




end

    # @fake_dir = Director.find_or_create_by(name: "Alan Smithee")

    # @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
    # if !@movie.valid?
    #     render :new
    # else