require 'byebug'
class ChoicesController < ApplicationController
  def new
    # @moviesearch = Omdb.search(params[:movie][:title]) ? 

  end

  def create
    #byebug
    @movie = Movie.new
    @moviesearch = Omdb.search(params[:choice][:title])
    render :new
  end 

end

    # @fake_dir = Director.find_or_create_by(name: "Alan Smithee")

    # @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
    # if !@movie.valid?
    #     render :new
    # else