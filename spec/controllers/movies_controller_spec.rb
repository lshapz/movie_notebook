require_relative "../rails_helper.rb"
require 'byebug'
RSpec.describe MoviesController, :type => :feature do
  
describe 'Route to view' do
    it 'has an index page' do
        visit movies_path
        expect(page.status_code).to eq(200)
        expect(page).to have_css("h1", text: "My Movie Notebook")
      end

    end

  describe 'Multiple movies' do
    it 'shows them on the index page' do
        new_movie
        movie_two
        visit movies_path
        expect(page).to have_link(@movie.title, href=@movie)
        expect(page).to have_link(@movie2.title, href=@movie2)
      end
end

  describe 'Show page' do
    it 'renders properly with expected text' do
        visit movie_path(new_movie)
        expect(page.status_code).to eq(200)
        expect(page).to have_css("h1", text: @movie.title)
        expect(page).to have_content(@director.name)
      end 

    it 'has the right links' do
        visit movie_path(new_movie)
        expect(page).to have_link(@director.name, href: director_path(@director))
        expect(page).to have_link("View On IMDb", href: @movie.link)
      end
  end

  describe 'New Page' do 
     it 'displays the choices from IMDb' do
        visit new_choice_path
        citizen_kane
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
      end 

      it 'creates a new movie from those choices' do 
        visit new_choice_path
        rate_kane(5)
        expect(page).to have_css("h1", text: "Citizen Kane")
      end 

      it 'throws an error if you enter an invalid rating' do 
        visit new_choice_path
        rate_kane(50)
        expect(page).to have_text('Rating must be less than or equal to 5')
      end 
  end

  describe 'Edit Page' do 
    it 'is accessible from a movie show page' do
        visit movie_path(new_movie)
        expect(page).to have_link("Edit Me", href:edit_movie_path(@movie))
      end

    it 'renders the form with the existing values filled in' do
        visit edit_movie_path(new_movie)
        expect(page).to have_css("input#movie_title")
      end

    it 'outputs an error on invalid value' do
        visit edit_movie_path(new_movie)
        fill_in("movie[year]", :with => "10")
        click_button('Update')
        expect(page).to have_text ("is before movies existed")
      end
  end 


end