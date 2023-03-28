class PlaylistBlueprint < Blueprinter::Base
  identifier :id
  association :user, blueprint: UserBlueprint, view: :normal
  fields :name
end
