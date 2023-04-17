class AddPolymorphicAttrsToRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :ratings, :rated_on_type, :string
    add_column :ratings, :rated_on_id, :integer
    remove_column :ratings, :movie_id, :integer
  end
end
