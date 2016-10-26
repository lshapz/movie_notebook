class User < ApplicationRecord
  has_secure_password 
  validates :name, presence: :true
  has_many :user_movies
  has_many :movies, through: :user_movies
end
