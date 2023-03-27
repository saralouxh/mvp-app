class Rating < ApplicationRecord
    belongs_to :movie
    belongs_to :user

    validates :rating, :movie_id, presence: true
end
