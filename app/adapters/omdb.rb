  require 'byebug'
class Omdb

  def self.search(title)
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {s: title, r: 'json'})  
    @thing = JSON.parse(movie_hash)
    @coll = @thing["Search"].each_with_object([]) do |result, coll|
      coll << Choice.new(title: result["Title"], year: result["Year"], imdbID: result["imdbID"])
    end 
  end

  def self.director(directors)
    if directors.include?(', ')
      director_array = directors.split(', ')
      first_director = director_array.shift
      @director = Director.find_or_create_by(name: first_director)
      @director.collab = director_array.join(", ")
      @director.save
    else 
      @director = Director.find_or_create_by(name: directors)
    end
  end 

  def self.newify(imdbID)
    movie_creator = RestClient.get('http://www.omdbapi.com/?', params: {i: imdbID, r: 'json'})    
    json = JSON.parse(movie_creator)
    @linkable = "http://imdb.com/title/" + json['imdbID']
    self.director(json['Director']) 
    movie_params = {title: json['Title'], year: json['Year'], director_id: @director.id, link: @linkable, imdbID: json['imdbID']}
  end 


end