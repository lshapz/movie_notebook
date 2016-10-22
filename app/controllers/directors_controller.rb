require 'byebug'
class DirectorsController < ApplicationController
  
  def index
    #byebug
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
  end

end
