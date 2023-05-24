class PlaylistBlueprint < Blueprinter::Base
  identifier :id
  association :user, blueprint: UserBlueprint, view: :normal
  association :movies, blueprint: MovieBlueprint, view: :normal

  fields :name
end
