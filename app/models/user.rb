class User < ActiveRecord::Base
  attr_accessible :auth_hash, :name
end
