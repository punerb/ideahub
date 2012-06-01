class Schedule < ActiveRecord::Base
  belongs_to :idea
  validates :idea_id, :scheduled_at, :location, :presence => true

  validate :schedule_date

  delegate :title, :to => :idea, :prefix => false, :allow_nil => true

  attr_accessible :idea_id, :scheduled_at, :location

  def can_delete?
    scheduled_at > DateTime.now
  end

  private

  def schedule_date
    self.errors[:scheduled_at] = 'Date is invalid' if self.scheduled_at < DateTime.now
  end

end
