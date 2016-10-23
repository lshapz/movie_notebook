class Movie < ApplicationRecord
  belongs_to :director
  validates :title, presence: true
  validates :year, presence: true, numericality: {greater_than: 1880, message: "is before movies existed"}
  validates :rating, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
