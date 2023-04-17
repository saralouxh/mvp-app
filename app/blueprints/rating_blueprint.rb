class RatingBlueprint < Blueprinter::Base
  identifier :id
  association :user, blueprint: UserBlueprint, view: :normal
  # association :movie, blueprint: MovieBlueprint
  # association :playlist, blueprint: PlaylistBlueprint
  fields :rating, :rated_on_type, :rated_on_id
end
