require 'byebug'
class Omdb

  def self.search(title)
    title2 = title.dup
    #this solves a bug about immutable variables or something
    title2.gsub!(/ /, "+")
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {s: title, r: 'json'})  
    @thing = JSON.parse(movie_hash)
    if @thing.first[1] == "False"
      # if they can't find any movies matching that title at all. probably not necessary with search api?
      @movie2 = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
      @movie2.save
      redirect_to movie_path(@movie2)
    end 
 #   @coll = []
    @coll = @thing["Search"].each_with_object([]) do |result, coll|
      coll << Choice.new(title: result["Title"], year: result["Year"], imdbID: result["imdbID"])
    end 
    # return value is an array of non-saved Choice instances  
 
  end

  def self.newify(imdbID, rating)
    @rating = rating #user input
    movie_creator = RestClient.get('http://www.omdbapi.com/?', params: {i: imdbID, r: 'json'})    
    json = JSON.parse(movie_creator)
    @linkable = "http://imdb.com/title/" + json['imdbID']
    dir = json['Director']
      # byebug
    if dir.include?(', ')
      #this if statement handles multiple director movies, easier than many-to-many but not ideal
      v = dir.split(', ')
      z = v.shift
      @director = Director.find_or_create_by(name: z)
      @director.collab = v.join(", ")
      # saves 2nd and 3rd directors as "collab" in 1st director row
      @director.save
    else 
      @director = Director.find_or_create_by(name: dir)
    end
  
    movie_params = {title: json['Title'], year: json['Year'], director_id: @director.id, link: @linkable, rating: @rating}
    # we don't create the movie in here because we want the validations to show up for the user
  end 


end