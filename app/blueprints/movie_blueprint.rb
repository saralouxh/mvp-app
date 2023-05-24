# Defines the JSON blueprint for the User model
class MovieBlueprint < Blueprinter::Base
  identifier :id
  fields :image, :title

  view :normal do
    # Define the fields you want to include in the 'normal' view
    fields :id, :title
  end
end
