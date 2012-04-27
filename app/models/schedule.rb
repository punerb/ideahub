class Schedule < ActiveRecord::Base
  belongs_to :idea
  validates :idea_id, :scheduled_at, :location, :presence => true

  delegate :title, :to => :idea, :prefix => false, :allow_nil => true

  attr_accessible :idea_id, :scheduled_at, :location
end
