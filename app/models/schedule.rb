class Schedule < ActiveRecord::Base
  belongs_to :idea
  validates :idea_id, :scheduled_at, :location, :presence => true
end
