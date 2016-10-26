require 'rails_helper'

RSpec.describe Movie, :type => :model do

  before :each do 
    new_movie
  end 
  
  it "is valid with a title and year" do 
    expect(@movie).to be_valid
  end 

  it "belongs to one director" do 
    expect(@movie.director).to eq (@director)
  end 

  it "is not valid with a bad year" do 
    @movie3 = Movie.create(title: "Movie", director_id: @director.id, year: 100, link: "http://imdb.com/title/tt0033467")
    expect(@movie3).not_to be_valid
  end
end