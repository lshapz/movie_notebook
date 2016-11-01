# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Director.create(name: "Alan Smithee")
# Movie.create([{title: "Star Wars", director_id: 1}, {title: "Episode 8", director_id: 2}, {title: "Episode never", director_id: 1}])

User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
User.create(name: Faker::Internet.user_name, password: Faker::Internet.password)
Director.create(name: "Orson Welles")
Movie.create(title: "Citizen Kane", director_id: 1, year: 1941, link:"http://imdb.com/title/tt0033467", imdbID:"tt0033467")
Director.create(name:"Kevin Smith")
Movie.create(title:"Mallrats", director_id: 2, year:1995, link:"http://imdb.com/title/tt0113749", imdbID:"tt0113749")
Director.create(name:"Joel Schumacher")
Movie.create(title:"Batman & Robin", director_id: 3, year: 1997, link:"http://imdb.com/title/tt0118688", imdbID:"tt0118688")
Director.create(name:"Paul Feig")
Movie.create(title:"Ghostbusters", director_id: 4, year:2016, link:"http://imdb.com/title/tt1289401", imdbID: "tt1289401")
Director.create(name:"Christopher Nolan")
Movie.create(title:"Memento", director_id:5, year:2000, link:"http://imdb.com/title/tt0209144", imdbID:"tt0209144")
Director.create(name:"Jamie Babbit")
Movie.create(title:"But I'm a Cheerleader", director_id:6, year:1999, link:"http://imdb.com/title/tt0179116", imdbID:"tt0179116")
UserMovie.create(user_id: 1, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 1, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 1, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 1, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 1, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 1, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 2, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 2, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 2, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 2, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 2, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 2, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 3, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 3, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 3, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 3, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 3, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 3, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 4, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 4, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 4, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 4, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 4, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 4, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 5, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 5, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 5, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 5, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 5, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 5, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 6, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 6, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 6, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 6, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 6, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 6, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 7, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 7, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 7, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 7, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 7, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 7, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 8, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 8, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 8, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 8, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 8, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 8, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 9, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 9, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 9, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 9, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 9, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 9, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 10, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 10, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 10, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 10, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 10, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 10, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 11, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 11, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 11, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 11, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 11, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 11, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 12, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 12, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 12, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 12, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 12, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 12, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 13, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 13, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 13, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 13, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 13, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 13, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))


UserMovie.create(user_id: 14, movie_id: 1, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1941, 2016))
UserMovie.create(user_id: 14, movie_id: 2, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1995, 2016))
UserMovie.create(user_id: 14, movie_id: 3, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1997, 2016))
UserMovie.create(user_id: 14, movie_id: 4, rating: Faker::Number.between(0, 5), year_seen: 2016, big_screen: true)
UserMovie.create(user_id: 14, movie_id: 5, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(2000, 2016))
UserMovie.create(user_id: 14, movie_id: 6, rating: Faker::Number.between(0, 5), year_seen: Faker::Number.between(1999, 2016))

