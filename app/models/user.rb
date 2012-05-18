class User < ActiveRecord::Base
  attr_accessible :name, :email, :screen_name
  has_many :services, :dependent => :destroy
  has_many :idea_users
  has_many :ideas, :through => :idea_users
  
  def self.tweet(msg)
    if Rails.env.production?
      twitter.update(msg)
    else
      puts "TWEET: #{msg}"
    end
  end

  private

  def self.twitter
    @@twitter_user ||= Twitter::Client.new(oauth_token: Setting.oauth_token, oauth_token_secret: Setting.oauth_token_secret)
  end

end
