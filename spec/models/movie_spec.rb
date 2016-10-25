require 'rails_helper'

RSpec.describe Movie, :type => :model do
  # test "the truth" do
  #   assert true
  # end
  before :each do 
    @director = Director.create(name: "Alan Smithee")
    @movie = Movie.create(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
  end 
  
  it "is valid with a title and year" do 
    expect(@movie).to be_valid
  end 

  it "belongs to one director" do 
    expect(@movie.director).to eq (@director)
  end 

  it "is not valid with a bad year" do 
    @movie = Movie.create(title: "Movie", director_id: @director.id, year: 100, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    expect(@movie).not_to be_valid
  end
end