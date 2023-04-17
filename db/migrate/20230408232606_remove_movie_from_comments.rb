class RemoveMovieFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :movie, null: true, foreign_key: true
  end
end
