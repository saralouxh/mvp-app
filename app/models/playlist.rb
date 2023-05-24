class Playlist < ApplicationRecord
    belongs_to :user
    has_many :movies, dependent: :destroy
    has_many :comments, as: :commentable
    has_many :ratings, as: :rated_on

    validates :name, presence: true
end
