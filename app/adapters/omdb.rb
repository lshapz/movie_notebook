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
    dir = show['Director']
    #byebug
    if dir.include?(', ')
      v = dir.split(', ')
      z = v.shift
        @director = Director.find_or_create_by(name: z)
        @director.collab = v.join(", ")
        @director.save
      else 
        @director = Director.find_or_create_by(name: dir)
      end
    movie_params = {title: show['Title'], year: show['Year'], director_id: @director.id, link: @linkable, rating: @rating}
    #byebug
  end


end