class IdeaCategory < ActiveRecord::Base
  belongs_to :idea
  belongs_to :category
  attr_accessible :idea_id, :category_id
  validates :category_id, :idea_id, :presence => true
end
