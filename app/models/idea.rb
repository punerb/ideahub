class Idea < ActiveRecord::Base

  has_many :users
  has_and_belongs_to_many :categories
  has_many :comments, :dependent => :destroy
  has_many :schedules, :dependent => :destroy

  validates :user_id, :title, :description, :presence => true

end
