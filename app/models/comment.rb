class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  validates :description, :user_id, :idea_id, :presence => true

  attr_accessible :description, :user_id, :idea_id
end
