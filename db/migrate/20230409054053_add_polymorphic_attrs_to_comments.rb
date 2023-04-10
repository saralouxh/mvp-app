class AddPolymorphicAttrsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :commentable_type, :string
    add_column :comments, :commentable_id, :integer
  end
end
