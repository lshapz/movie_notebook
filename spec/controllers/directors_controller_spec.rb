require 'rails_helper'
require 'byebug'
RSpec.describe DirectorsController, :type => :feature do
  
describe 'Route to view' do
  it 'has an index page' do
    #, js: true
    visit directors_path
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: "Directors")
  end
end


describe 'Show page' do

  it 'renders properly' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    # binding.pry
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: @director.name)
  end

  it 'has links to movie pages' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    @movie2 = Movie.create!(title: "Movie 2", director_id: @director.id, year: 1957, link: "http://imdb.com/title/tt0333467", rating: 3.75)
    visit director_path(@director)
    expect(page).to have_link(@movie.title, href: movie_path(@movie.id))
    expect(page).to have_link(@movie2.title, href: movie_path(@movie2.id))
  end

  it 'lists collaborators if exist' do
    @director = Director.create!(name: "Alan Smithee", collab: "Smith Alan")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    expect(page).to have_text(@director.collab)
  end 


end



end