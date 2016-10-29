class UserMovie < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    validates :user_id, presence: true
    validates :movie_id, presence: true
    validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    validate :movie_year

def movie_year
  unless self.year_seen >= self.movie.year 
    self.errors.add(:year_seen, 'must be later than movie release year')
  end
end 

def movie
  @movie = Movie.find(self.movie_id)
end

end
