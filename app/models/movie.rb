class Movie < ApplicationRecord
    has_many :playlists
    has_many :ratings
    has_many :comments

    validates :imdb_id, uniqueness: true
    validates :imdb_id, :title, presence: true
end
