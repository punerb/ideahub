class Idea < ActiveRecord::Base

  has_many :idea_users
  has_many :users, :through => :idea_users
  has_many :comments, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  has_many :idea_categories
  has_many :categories, :through => :idea_categories

  validates :user_id, :title, :description, :presence => true
  attr_accessible :title, :description, :user_id
end
