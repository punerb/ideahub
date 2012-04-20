class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
  
  Setting.consumer_key = 'your twitter consumer key'
  Setting.consumer_secret = 'your twitter consumer secret'
  Setting.oauth_token = 'your twitter access token'
  Setting.oauth_token_secret = 'your twitter access token secret'

end
