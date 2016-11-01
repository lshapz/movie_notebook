module MovieHelper

def log_in
  @user = User.create(name: "laura", password: "password")
  page.set_rack_session(user_id: @user.id)
  # visit new_session_path
  # byebug
  # fill_in('name', :with => "laura")
  # fill_in('password', :with => "password")
  # click_button('Submit')
end

def new_movie
  @director = Director.find_or_create_by!(name: "Alan Smithee")
  @movie = Movie.find_or_create_by!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", imdbID: "tt0033467")
end

def movie_two
  @director = Director.find_or_create_by!(name: "Alan Smithee")
  @movie2 = Movie.find_or_create_by!(title: "Movie 2", director_id: @director.id, year: 1957, link: "http://imdb.com/title/tt0333467", imdbID: "tt0333467")
end

def citizen_kane
    fill_in('choice[title]', :with => "Citizen Kane")
    click_button('Search')
end

# def rate_kane(rating)
#     citizen_kane
#     choose ('imdbID_tt0033467')
#     fill_in('rating', with: rating)
#     click_button('Choose')
# end


end 