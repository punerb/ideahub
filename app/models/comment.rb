class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user
  validates :description, :user_id, :idea_id, :presence => true
end
