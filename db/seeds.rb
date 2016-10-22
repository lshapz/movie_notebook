# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Director.create(name: "Gus")
Director.create(name: "Matt")
Movie.create([{title: "Star Wars", director_id: 1}, {title: "Episode 8", director_id: 2}, {title: "Episode never", director_id: 1}])