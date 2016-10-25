require 'rails_helper'
require 'byebug'
RSpec.describe DirectorsController, :type => :feature do
  
describe 'Route to view' do
  it 'has an index page' do
    #, js: true
    visit directors_path
    expect(page.status_code).to eq(200)
    # => expect(page).to have_css("h1")
  end
end


describe 'Show page' do
  # before do
  #   @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
  # end
  it 'renders properly' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    #binding.pry
    expect(page.status_code).to eq(200)
  end

  it 'renders the title name in a h1 tag' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    # binding.pry
    expect(page).to have_css("h1", text: @director.name)
  end

  it 'links to movie page' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    expect(page).to have_link(@movie.title, href: movie_path(@movie.id))
  end

  it 'lists collaborators if exist' do
    @director = Director.create!(name: "Alan Smithee", collab: "Smith Alan")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit director_path(@director)
    expect(page).to have_text(@director.collab)
  end 


end



end