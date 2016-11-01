require 'rails_helper'
require 'byebug'
RSpec.describe ChoicesController, :type => :feature do
  
describe 'Route to view' do
    it 'renders' do
      log_in

      visit new_choice_path
      expect(page.status_code).to eq(200)
      expect(page).to have_css("h1", "Find A Movie By Searching IMDb!")
    end
  end

  describe 'fill in form' do
       it 'goes to the right place' do
        log_in
        visit new_choice_path
        citizen_kane
        expect(current_path).to eq('/choices')
      end 

      it 'displays the choices from IMDb' do
        log_in
        visit new_choice_path
        citizen_kane
        expect(page).to have_text("Citizen Kane 1941")
        expect(page).to have_text("Beyond Citizen Kane 1993")
      end 
  end 

end 
