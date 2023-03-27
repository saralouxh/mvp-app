class CommentBlueprint < Blueprinter::Base 
    identifier :id
    fields :content, :movie, :user, :created_at
end