require 'rails_helper'
require 'byebug'
RSpec.describe ChoicesController, :type => :feature do
  
describe 'Route to view' do
    it 'renders' do
      log_in
      visit new_choice_path
      expect(page.status_code).to eq(200)
      expect(page).to have_css("h1", text: "Find A Movie By Searching IMDb!")
    end
  end

  describe 'fill in form' do
       it 'goes to the right place' do
        citizen_kane
        expect(current_path).to eq('/choices')
      end 

      it 'displays the choices from IMDb' do
        citizen_kane
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
      end 
  end 

  describe 'create' do
    it "creates a movie and a UserMovie from the choices given" do  
      rate_kane(5, 1999)
      expect(page).to have_css("h1", text: "Citizen Kane")
      expect(page).to have_text("First Seen: 1999")
      expect(page).to have_text("Seen in theaters? Nope")
    end 

    it "re-renders form with just the selected movie when UserMovie doesn't validate" do
      rate_kane(7, 1900)
      expect(page).not_to have_text("Beyond Citizen Kane 1993")
      expect(page).to have_text("Year seen must be later than movie release year")
      expect(page).to have_text("Rating must be less than or equal to 5")
    end
  end 

end 
