class RatingBlueprint < Blueprinter::Base 
    identifier :id
    fields :rating, :movie, :user, :created_at
end