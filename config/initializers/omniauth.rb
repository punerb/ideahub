TWITTER_KEY= 'lBzoa7p7BDWR98IOsmcQQ'
TWITTER_SECRET= 'ur4TjBbwGOPJ1ieY9oFHK5z6w6bhiUMVgrEQxsVf4hY'
OAUTH_TOKEN = 'asfasf'
OAUTH_TOKEN_SECRET = ''

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :twitter, TWITTER_KEY, TWITTER_SECRET
end

Twitter.configure do |config|
  config.consumer_key = TWITTER_KEY
  config.consumer_secret = TWITTER_SECRET
end
