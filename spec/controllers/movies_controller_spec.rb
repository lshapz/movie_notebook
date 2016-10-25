require 'rails_helper'
require 'byebug'
RSpec.describe MoviesController, :type => :feature do
  
describe 'Route to view' do
  it 'has an index page' do
    #, js: true
    visit movies_path
    expect(page.status_code).to eq(200)
    # => expect(page).to have_css("h1")
  end

  # it 'renders links to movies' do 
  #   # binding.pry
  #   # director :create, {name: "Alan Smithee"}
  #   # movie :create, {title: "Movie", director_id: 1, year: 1956}
  #   visit movies_path
  #   #expect(response).to have_css
  # end 
end

  # @director = Director.create(name: "Alan Smithee")


describe 'Multiple movies' do
  it 'shows them on the index page' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    @movie2 = Movie.create!(title: "Movie2", director_id: @director.id, year: 1958, link: "http://imdb.com/title/tt3033467", rating: 3.75)

    visit movies_path
     #byebug
    expect(page).to have_link(@movie.title, href=@movie.id)
    expect(page).to have_link(@movie2.title, href=@movie2.id)

  end
end


describe 'Show page' do
  # before do
  #   @student = Student.create!(first_name: "Daenerys", last_name: "Targaryen")
  # end
  it 'renders properly' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    #binding.pry
    expect(page.status_code).to eq(200)
  end

  it 'renders the title name in a h1 tag' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    # binding.pry
    expect(page).to have_css("h1", text: @movie.title)
  end

  it 'links to director page' do
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    expect(page).to have_link(@director.name, href: director_path(@director.id))
  end

  it 'links to the IMDb page' do 
    @director = Director.create!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
    visit movie_path(@movie)
    expect(page).to have_link("View On IMDb", href: @movie.link)
  end 

  # it 'renders the last name in a h1 tag' do
  #   visit student_path(@student)
  #   expect(page).to have_css("h1", text: "Targaryen")
  # end

  # it 'renders the active status if the user is inactive' do
  #   visit student_path(@student)
  #   expect(page).to have_content("This student is currently inactive.")
  # end

  # it 'renders the active status if the user is active' do
  #   @student.active = true
  #   @student.save
  #   visit student_path(@student)
  #   expect(page).to have_content("This student is currently active.")
  # end
end

describe 'New Page' do 
    it 'displays the choices from IMDb' do
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
        #!! make a test helper with a method for this? 
      end 

    # it 'can choose one and initialize a movie'
    #     it 'displays the choices from IMDb' do
    #     visit new_choice_path
    #     fill_in('choice[title]', :with => "Citizen Kane")
    #     click_button('Search')
    #     expect(current_path).to eq('/movies/')

    #   end 
    # end 
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

  #check for errors  

end 


end