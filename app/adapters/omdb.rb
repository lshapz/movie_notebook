require 'byebug'
class Omdb

  def self.search(title, year, rating)
    @rating = rating
    title2 = title
    title2 = title2.gsub(/ /, "+")
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {t: title, r: 'json', y: year})  
    show = JSON.parse(movie_hash)
    if show['imdbID']
      @linkable = "http://imdb.com/title/" + show['imdbID']
    end
    @director = Director.find_or_create_by(name: show['Director'])
    movie_params = {title: show['Title'], year: show['Year'], director_id: @director.id, link: @linkable, rating: @rating}
    #byebug
  end


end