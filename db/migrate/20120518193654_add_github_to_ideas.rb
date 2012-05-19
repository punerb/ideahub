class AddGithubToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :github, :string
  end
end
