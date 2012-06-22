class CreateFeatherPages < ActiveRecord::Migration
  def change
    create_table :feather_pages do |t|
      t.string :name
      t.string :status, :default => 'draft'
      
      t.text   :content
      
      t.string :layout, :default => 'application'
      t.timestamps
    end
  end
end
