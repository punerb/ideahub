## Josh Open Source Friday's

### This is the place to be on Friday's.

## Get Started

1. Install bundle
  
  bundle install

2. Please use passenger as rails server

  gem install passenger

2. Add /etc/hosts entry

  127.0.0.1 ideahub.local

3. Start server using your own username

  rvmsudo passenger start -p 80 -a ideahub.local --user sandip


## To enable the Twitter integration you should do following once during the initial setup through rails console:

Setting.consumer_key = 'your twitter consumer key'
Setting.consumer_secret = 'your twitter consumer secret'
Setting.oauth_token = 'your twitter access token'
Setting.oauth_token_secret = 'your twitter access token secret'
