require 'rails_helper'
require 'byebug'
RSpec.describe ChoicesController, :type => :feature do
  
describe 'Route to view' do
    it 'renders' do
      #, js: true
      visit new_choice_path
      expect(page.status_code).to eq(200)
       expect(page).to have_css("h1", "Find A Movie By Searching IMDb!")
    end
  end

  describe 'fill in form' do
       it 'goes to the right place' do
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        expect(current_path).to eq('/choices')
      end 

      it 'displays the choices from IMDb' do
        visit new_choice_path
        fill_in('choice[title]', :with => "Citizen Kane")
        click_button('Search')
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
      end 
  end 



end 

#   # it 'renders links to movies' do 
#   #   # binding.pry
#   #   # director :create, {name: "Alan Smithee"}
#   #   # movie :create, {title: "Movie", director_id: 1, year: 1956}
#   #   visit movies_path
#   #   #expect(response).to have_css
#   # end 
# end

#   # @director = Director.create(name: "Alan Smithee")


# # describe 'choosing movies' do
# #   it 'shows movie info' do
# #     @choice1 = Choice.create!(title: "Title", year: "Year", imdbID: "imdbID")
# #     @choice2 = Choice.create!(title: "Title 2", year: "Year 2", imdbID: "imdbID 2")

# #     visit new_choice_path
# #      #byebug
# #     expect(page).to have_text("Title")
# #   end

# #   it 'can choose a movie' do
# #     @choice1 = Choice.create!(title: "Title", year: "Year", imdbID: "imdbID")
# #     @choice2 = Choice.create!(title: "Title 2", year: "Year 2", imdbID: "imdbID 2")
# #     visit new_choice_path
# #     choose('imdbID_imdbID')
# #     click_button('select')
# #     byebug
# #     #expect 

# #   end 
# end




# end