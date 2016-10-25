require 'byebug'
class ChoicesController < ApplicationController
  def new

  end

  def create
    new_movie = Omdb.newify(params["imdbID"], params["rating"])
    # takes user choice and actually gets movie info 
    @movie = Movie.new(new_movie)
    # here is where we should be flashing validation at the user 
    # but I think it breaks because of the two page creation process
    @movie.save 
    redirect_to movie_path(@movie)
  end 

end

    # @fake_dir = Director.find_or_create_by(name: "Alan Smithee")

    # @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
    # if !@movie.valid?
    #     render :new
    # else