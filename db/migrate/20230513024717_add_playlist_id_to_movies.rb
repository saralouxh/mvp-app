class AddPlaylistIdToMovies < ActiveRecord::Migration[7.0]
  def change
    add_reference :movies, :playlist, null: false, foreign_key: true
  end
end
