class CreateIdeaCategories < ActiveRecord::Migration
  def change
    create_table :idea_categories do |t|
      t.references :idea
      t.references :category

      t.timestamps
    end
  end
end
