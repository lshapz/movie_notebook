require 'rails_helper'

RSpec.describe UsersController, type: :feature do

  describe "#show" do
    it "displays a chart of your movie rankngs" do
      rate_kane(5, 1999)
      visit user_path(@user)
      # byebug
      expect(page).to have_text("Year Seen: 1999")
      expect(page).to have_css("div#chart-1")
    end
  end


  describe "#create" do 
    it "logs you in when you create a new user" do 
      visit new_user_path
      fill_in("user_name", :with => "Capy")
      fill_in("user_password", :with => "bara")
      click_button('Create User')
      expect(page).to have_css("h3", text: "My Movies")
      @user = User.find_by(name: "Capy")
      expect(page.get_rack_session_key('user_id')).to eq(@user.id)
    end
  end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
