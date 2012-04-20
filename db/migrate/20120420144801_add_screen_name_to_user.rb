class AddScreenNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :screen_name, :string
  end
end
