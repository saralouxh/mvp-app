class CommentBlueprint < Blueprinter::Base
  identifier :id
  association :user, blueprint: UserBlueprint, view: :normal
  # association :movie, blueprint: MovieBlueprint
  # association :playlist, blueprint: PlaylistBlueprint
  fields :content, :commentable_type, :commentable_id
end
