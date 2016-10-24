require 'byebug'
class Omdb

  def self.search(title)
    # @rating = rating
    title2 = title.dup
    title2.gsub!(/ /, "+")
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {s: title, r: 'json'})  
    @thing = JSON.parse(movie_hash)
    if @thing.first[1] == "False"
      @movie2 = Movie.new(title: params[:movie][:title], year: params[:movie][:year], rating: params[:movie][:rating], director_id: @fake_dir.id)
      @movie2.save
      redirect_to movie_path(@movie2)
    end 
    @coll = []
    # @thing.first[1].each {|x| @coll <<  [x["Title"], x["Year"], x] }
    @coll = @thing["Search"].each_with_object([]) do |result, coll|
      coll << Choice.new(title: result["Title"], year: result["Year"], imdbID: result["imdbID"])
    end 
    # @another = @thing.each_with_object([]) {|x, an| an << Choice.new(title: x[0], year: x[1], title: x[2])}

  end

  def self.newify(imdbID, rating)
    @rating = rating
    movie_creator = RestClient.get('http://www.omdbapi.com/?', params: {i: imdbID, r: 'json'})    
    json = JSON.parse(movie_creator)
    @linkable = "http://imdb.com/title/" + json['imdbID']
    dir = json['Director']
      # byebug
    if dir.include?(', ')
      v = dir.split(', ')
      z = v.shift
      @director = Director.find_or_create_by(name: z)
      @director.collab = v.join(", ")
      @director.save
    else 
      @director = Director.find_or_create_by(name: dir)
    end
  
    movie_params = {title: json['Title'], year: json['Year'], director_id: @director.id, link: @linkable, rating: @rating}
  end 


end