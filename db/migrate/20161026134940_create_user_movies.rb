class CreateUserMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :user_movies do |t|
      t.integer :movie_id
      t.integer :user_id
      t.integer :rating
      t.integer :year_seen
      t.boolean :big_screen

      t.timestamps
    end
  end
end
