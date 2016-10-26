class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :director_id
      t.integer :year
      t.string :link
      t.string :imdbID
      t.timestamps
    end
  end
end
