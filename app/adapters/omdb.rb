class Omdb

  def self.search(title, year)
    title.to_s
    title = title.gsub!(/ /, "+")
    movie_hash = RestClient.get('http://www.omdbapi.com/?', params: {t: title, r: 'json', y: year})  
    show = JSON.parse(movie_hash)
    linkable = "http://imdb.com/title/" + show['imdbID']
    params = {title: show['Title'], year: show['Year'], director: show['Director'], link: @linkable}
    Movie.create(params) 
  end


end