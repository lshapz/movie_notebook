require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe MoviesController, :type => :feature do
  
describe 'Route to view' do
  it 'has an index page' do
    #, js: true
    visit movies_path
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: "My Movie Notebook")
  end

end


describe 'Multiple movies' do
  it 'shows them on the index page' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    @movie2 = Movie.create!(title: "Movie2", director_id: @director.id, year: 1958, link: "http://imdb.com/title/tt3033467", rating: 3.75)

    visit movies_path
    # byebug
    expect(page).to have_link(@movie.title, href=@movie.id)
    expect(page).to have_link(@movie2.title, href=@movie2.id)

  end
end


describe 'Show page' do

  it 'renders properly with expected text' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    #binding.pry
    expect(page.status_code).to eq(200)
    expect(page).to have_css("h1", text: @movie.title)
  end 

  it 'has the right links' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    expect(page).to have_link(@director.name, href: director_path(@director.id))
    expect(page).to have_link("View On IMDb", href: @movie.link)
  end


end

describe 'New Page' do 
     it 'displays the choices from IMDb' do
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
      end 

      it 'creates a new movie from those choices' do 
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        choose ('imdbID_tt0033467')
        fill_in('rating', with: 5)
        click_button('Choose')
        expect(page).to have_css("h1", text: "Citizen Kane")
      end 

      it 'throws an error if you enter an invalid rating' do 
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        choose ('imdbID_tt0033467')
        fill_in('rating', with: 50)
        click_button('Choose')
        expect(page).to have_text('Rating must be less than or equal to 5')
      end 
    #it can create a new movie? 

end

describe 'Edit Page' do 
  it 'is accessible from a movie show page' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    # byebug
    visit movie_path(@movie)
    expect(page).to have_link("Edit Me", href:edit_movie_path(@movie))
  end

  it 'renders the form with the existing values filled in' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    # byebug
    visit edit_movie_path(@movie)
    expect(page).to have_css("input#movie_title")
  end

  it 'outputs an error on invalid value' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    # byebug
    visit edit_movie_path(@movie)
    fill_in("movie[year]", :with => "10")
    click_button('Update')
    expect(page).to have_text ("is before movies existed")
  end

end 


end