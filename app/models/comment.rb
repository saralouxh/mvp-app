class Comment < ApplicationRecord
    # belongs_to :movie
    # belongs_to :playlist
    belongs_to :user
    belongs_to :commentable, polymorphic: true

    # validates :content, :movie_id, presence: true
    validates :content, presence: true
end
