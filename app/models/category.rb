class Category < ActiveRecord::Base
  has_and_belongs_to_many :ideas
  validates :name, :presence => true
end
