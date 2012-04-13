TWITTER_KEY= '87rSkJ7tzINtNOefJ6FfGQ'
TWITTER_SECRET= 'TfXgJgKUo35olGwHNAY36HcMx2HhlNUHMSiNCXXjo'

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :developer unless Rails.env.production?
  provider :twitter, TWITTER_KEY, TWITTER_SECRET
end
