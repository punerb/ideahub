class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :services

end
