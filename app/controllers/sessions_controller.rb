class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end

=begin
# Set all necessary auth info
# Twitter.consumer_key = TWITTER_CONSUMER_KEY_GOES_HERE
# Twitter.consumer_secret = TWITTER_CONSUMER_SECRET_GOES_HERE
# Twitter.oauth_token = current_user.token
# Twitter.oauth_token_secret = current_user.token_secret
=end
