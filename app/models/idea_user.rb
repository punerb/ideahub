class IdeaUser < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  attr_accessible :user_id, :idea_id
  validates :user_id, :idea_id, :presence => true
end
