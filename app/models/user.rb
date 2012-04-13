class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :services, :dependent => :destroy

end
