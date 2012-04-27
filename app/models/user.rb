class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :services, :dependent => :destroy
  has_many :idea_users
  has_many :ideas, :through => :idea_users

end
