class Movie < ApplicationRecord
  belongs_to :director
  validates :title, presence: true
  validates :imdbID, uniqueness: true
  validates :year, presence: true, numericality: {greater_than: 1880, message: "is before movies existed"}
  has_many :user_movies
  has_many :users, through: :user_movies
  # still a float though! 4.75 ftw 
end
