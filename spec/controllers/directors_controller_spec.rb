require 'rails_helper'
require 'byebug'
RSpec.describe DirectorsController, :type => :feature do
  
describe 'Route to view' do
  it 'has an index page' do
    visit directors_path
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: "Directors")
  end
end

describe 'Show page' do
  it 'renders properly' do
    visit director_path(new_movie)
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: @director.name)
  end

  it 'has links to movie pages' do 
    new_movie
    movie_two
    visit director_path(@movie)
    expect(page).to have_link(@movie.title, href: movie_path(@movie))
    expect(page).to have_link(@movie2.title, href: movie_path(@movie2))
  end

  it 'lists collaborators if exist' do
    new_movie
    @director.collab = "Smith Alan"
    @director.save
    visit director_path(@director)
    expect(page).to have_text(@director.collab)
  end 
end

end