class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :rated_on, polymorphic: true

    validates :rating, presence: true
end
