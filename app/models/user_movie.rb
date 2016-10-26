class UserMovie < ApplicationRecord
    validates :user_id, presence: true
    validates :movie_id, presence: true
    validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
#    validates :year_seen, presence: true, numericality: {greater_than: movie_year, message: "is before movie was released"}

def movie_year
  movie = Movie.find(self.movie_id)
  movie_year = movie.year
end 

end
