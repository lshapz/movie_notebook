require 'rails_helper'
require 'byebug'
RSpec.describe UserMoviesController, :type => :feature do

describe "#edit" do
  it "prefills the opinion field with your opinion if you already had one" do 
    rate_kane(5, 1999)
    click_button("Edit Movie")
    assert page.has_unchecked_field?('big_screen')
    expect(page).to have_selector("input[value='5']")
    expect(page).to have_selector("input[value='1999']")
  end
end 

describe '#update' do
  it "does not allow you to edit your opinion to be invalid" do 
    rate_kane(5, 1999)
    edit_rating(7, 1900)
    expect(page).to have_text("Year seen must be later than movie release year")
    expect(page).to have_text("Rating must be less than or equal to 5")
    assert page.has_checked_field?('big_screen')
  end

  it "does update the values for you otherwise" do
    rate_kane(5, 1999)
    edit_rating(4, 1998)
    expect(page).to have_css("h1", text: "Citizen Kane")
    expect(page).to have_text("My Rating: 4")
    expect(page).to have_text("Seen in theaters? Yep")
  end 
end


end 