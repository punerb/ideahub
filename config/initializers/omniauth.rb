TWITTER_KEY= Setting.consumer_key 
TWITTER_SECRET= Setting.consumer_secret

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :twitter, TWITTER_KEY, TWITTER_SECRET
end

Twitter.configure do |config|
  config.consumer_key = TWITTER_KEY
  config.consumer_secret = TWITTER_SECRET
end
