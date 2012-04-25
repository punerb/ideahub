## Josh Open Source Friday IdeaHub

Every Friday evening at Josh Software, we have fun! This is the time when we 
work on some opensource projects, build our own ideas and learn. 

This is so much fun that we wanted to to the next level. i
we have opened this activity to the community - Friday evening at Josh.

> Come one, come all!
> If you have an idea you want to get built from the awesome Ruby Community,
> if you just want to code on some open source ideas, come on over to Josh on Friday!

IdeaHub itself is a product of Josh Open Source Friday. This is a portal where you
can suggest ideas or participate in them.

## How does this work?

Signup is **only** via Twitter. There are no emails saved, only twitter handles.

* If you have an idea, you can suggest it here. 
* If you like an idea and want to code, you can participate
* You would be notified by a tweet if that idea is being worked on a Friday at Josh.

## Setting this up yourself!

1. Install bundle
  
    bundle install

2. Please use passenger as rails server

    gem install passenger

2. Add /etc/hosts entry

    127.0.0.1 ideahub.local

3. Start server using your own username

    rvmsudo passenger start -p 80 -a ideahub.local --user <username>


## Twitter integration setup 

To enable the Twitter integration into the application, you should do the following 
once during the initial setup through rails console:

    Setting.consumer_key = 'your twitter consumer key'
    Setting.consumer_secret = 'your twitter consumer secret'
    Setting.oauth_token = 'your twitter access token'
    Setting.oauth_token_secret = 'your twitter access token secret'
