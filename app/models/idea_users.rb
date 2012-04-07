class IdeaUsers < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  validates :user_id, :idea_id, :presence => true
end
