# Defines the JSON blueprint for the User model
class MovieBlueprint < Blueprinter::Base
  identifier :id
  fields :imdb_id, :title
end
