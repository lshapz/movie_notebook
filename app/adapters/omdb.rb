require 'byebug'
class Omdb

  def self.search(title)
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {s: title, r: 'json'})  
    @thing = JSON.parse(movie_hash)
    @coll = @thing["Search"].each_with_object([]) do |result, coll|
      coll << Choice.find_or_create_by(title: result["Title"], year: result["Year"], imdbID: result["imdbID"])
    end 
      # byebug
 
  end

  def self.newify(imdbID)
    movie_creator = RestClient.get('http://www.omdbapi.com/?', params: {i: imdbID, r: 'json'})    
    json = JSON.parse(movie_creator)
    @linkable = "http://imdb.com/title/" + json['imdbID']
    directors = json['Director']
      # byebug
    if directors.include?(', ')
      # this if statement handles multiple director movies, easier than many-to-many but not ideal
      director_array = directors.split(', ')
      first_director = director_array.shift
      @director = Director.find_or_create_by(name: first_director)
      @director.collab = director_array.join(", ")
      # saves 2nd and 3rd directors as "collab" in 1st director row
      @director.save
    else 
      @director = Director.find_or_create_by(name: directors)
    end
  
    movie_params = {title: json['Title'], year: json['Year'], director_id: @director.id, link: @linkable, imdbID: json['imdbID']}
    # we don't create the movie in here because we want the validations to show up for the user
  end 


end