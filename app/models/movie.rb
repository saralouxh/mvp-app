class Movie < ApplicationRecord
    belongs_to :playlist
    has_many :ratings, as: :rated_on
    has_many :comments, as: :commentable

    validates :image, :title, presence: true
end
