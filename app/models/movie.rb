class Movie < ApplicationRecord
    has_many :playlists
    has_many :ratings, as: :rated_on
    has_many :comments, as: :commentable

    validates :imdb_id, uniqueness: true
    validates :imdb_id, :title, presence: true
end
