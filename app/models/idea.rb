class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :idea_users, :dependent => :destroy
  has_many :users, :through => :idea_users
  has_many :comments, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  has_many :idea_categories, :dependent => :destroy
  has_many :categories, :through => :idea_categories

  validates :user_id, :title, :description, :presence => true
  
  attr_accessible :title, :description, :user_id, :category_ids

  before_save :format_description

  def format_description
    self.description = RedCloth.new(description, [:lite_mode]).to_html
  end
end
