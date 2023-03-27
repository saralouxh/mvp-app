class Comment < ApplicationRecord
    belongs_to :movie
    belongs_to :user

    # had to add movie_id to validations
    validates :content, :movie_id, presence: true
end
