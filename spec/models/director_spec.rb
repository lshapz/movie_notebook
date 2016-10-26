require 'rails_helper'

RSpec.describe Director, :type => :model do

  it "has many movies" do 
    new_movie
    movie_two
    expect(@director.movies.first).to eq (@movie)
    expect(@director.movies.last).to eq (@movie2)
    @movie3 = Movie.create(title: "Movie 3", director_id: 3, year: 1957, link: "http://imdb.com/title/tt0433467")
    expect(@movie3.director).not_to eq (@director)
  end 

end
