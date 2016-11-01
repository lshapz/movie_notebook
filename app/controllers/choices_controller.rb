require 'byebug'
class ChoicesController < ApplicationController
    before_action :require_logged_in

  def new
    # @moviesearch = Omdb.search(params[:movie][:title]) ? 
    @choice = Choice.new
  end

  def create
    # byebug
    @moviesearch = Omdb.search(params[:choice][:title])
    # byebug
    render '/movies/new'
    # byebug
  end 

end

    # @fake_dir = Director.find_or_create_by(name: "Alan Smithee")

    # @movie = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
    # if !@movie.valid?
    #     render :new
    # else