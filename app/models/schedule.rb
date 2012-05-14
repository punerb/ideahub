class Schedule < ActiveRecord::Base
  belongs_to :idea
  validates :idea_id, :scheduled_at, :location, :presence => true

  delegate :title, :to => :idea, :prefix => false, :allow_nil => true

  attr_accessible :idea_id, :scheduled_at, :location

  after_create do
    get_participants.each do |p|
      User.tweet("@#{p.screen_name} new schedule is created in '#{idea.title}'")
    end
  end

  private
    def get_participants
      idea.users
    end
end
