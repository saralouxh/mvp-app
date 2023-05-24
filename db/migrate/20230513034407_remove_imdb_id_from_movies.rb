class RemoveImdbIdFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :imdb_id, :string
  end
end
