module MovieHelper


def new_movie
    @director = Director.find_or_create_by!(name: "Alan Smithee")
    @movie = Movie.create!(title: "Movie", director_id: @director.id, year: 1956, link: "http://imdb.com/title/tt0033467", rating: 4.75)
end

def movie_two
  @director = Director.find_or_create_by!(name: "Alan Smithee")
  @movie2 = Movie.create!(title: "Movie 2", director_id: @director.id, year: 1957, link: "http://imdb.com/title/tt0333467", rating: 3.75)
end

def citizen_kane
    fill_in('choice[title]', :with => "Citizen Kane")
    click_button('Search')
end

def rate_kane(rating)
    citizen_kane
    choose ('imdbID_tt0033467')
    fill_in('rating', with: rating)
    click_button('Choose')
end


end 