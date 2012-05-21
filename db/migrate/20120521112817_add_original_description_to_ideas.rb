class AddOriginalDescriptionToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :original_desc, :text
  end
end
