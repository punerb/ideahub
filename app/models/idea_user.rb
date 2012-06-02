class IdeaUser < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  attr_accessible :user_id, :idea_id
  validates :user_id, :idea_id, :presence => true

  scope :by_idea_and_user, lambda {|user_id, idea_id| where('user_id = ? and idea_id = ?',user_id,idea_id)}
end
