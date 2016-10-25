require 'rails_helper'

RSpec.describe Director, :type => :model do
  # test "the truth" do
  #   assert true
  # end
  before :each do 
    @director = Director.create(name: "Alan Smithee")
    @movie = Movie.create(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    @movie2 = Movie.create(title: "Movie 2", director_id: @director.id, year: 1957, link: "http://imdb.com/title/tt0433467", rating: 3.75)
  end 
  

  it "has many movies" do 
    expect(@director.movies.first).to eq (@movie)
    expect(@director.movies.last).to eq (@movie2)
    @movie3 = Movie.create(title: "Movie 2", director_id: 3, year: 1957, link: "http://imdb.com/title/tt0433467", rating: 3.75)
    expect(@movie3.director).not_to eq (@director)
  end 

end
