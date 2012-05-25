class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :idea_users, :dependent => :destroy
  has_many :users, :through => :idea_users
  has_many :comments, :dependent => :destroy
  has_many :schedules, :dependent => :destroy
  has_many :idea_categories, :dependent => :destroy
  has_many :categories, :through => :idea_categories

  validates :user_id, :title, :original_desc, :presence => true
  
  attr_accessible :title, :original_desc, :user_id, :category_ids, :github

  before_save :format_description

  def format_description
    self.description = RedCloth.new(original_desc, [:lite_mode]).to_html
  end
end
