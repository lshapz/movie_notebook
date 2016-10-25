require 'byebug'
class DirectorsController < ApplicationController
  
  def index
    unalpha = Director.all
    @directors = unalpha.sort_by {|director| director.name}
  end

  def show
    @director = Director.find(params[:id])
  end

end
