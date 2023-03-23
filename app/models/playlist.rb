class Playlist < ApplicationRecord
    has_many :movies
    belongs_to :user

    validates :name, presence: true
    
end
