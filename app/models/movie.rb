class Movie < ApplicationRecord
  belongs_to :director
  validates :title, presence: true
  validates :year, presence: true, numericality: {greater_than: 1880, message: "is before movies existed"}
  #still a float though! 4.75 ftw 
end
