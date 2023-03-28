class CommentBlueprint < Blueprinter::Base
  identifier :id
  association :user, blueprint: UserBlueprint, view: :normal
  association :movie, blueprint: MovieBlueprint
  fields :content
end
