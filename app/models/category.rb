class Category < ActiveRecord::Base
  has_many :idea_categories
  has_many :ideas, :through => :idea_categories
  validates :name, :presence => true
  attr_accessible :name

  def self.options
    all.collect{|c| [c.name, c.id]}
  end
end
