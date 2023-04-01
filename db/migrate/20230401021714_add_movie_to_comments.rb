class AddMovieToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :movie, null: true, foreign_key: true
  end
end
