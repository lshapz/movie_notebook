require 'rails_helper'

RSpec.describe UserMovie, type: :model do

  it "will not accept a year seen less than the release year" do 
    @user = User.create(name: "Laura", password: "password")
    movie_two
    movierating = UserMovie.new(rating: 5, year_seen: 1900, movie_id: @movie2.id, user_id: @user.id)
    expect(movierating.valid?).to be false
  end

end
