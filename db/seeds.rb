# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(
  %w{Ruby Javascript Rails CMS CRM Testing Nodejs Gem Api }.collect { |c| { name: c } }
)

Setting.consumer_key = 'your consumer key here'
Setting.consumer_secret = 'your consumer secret here.'
#Setting.oauth_token = 'your twitter access token'
#Setting.oauth_token_secret = 'your twitter access token secret'


5.times do |i|
  User.create({name: "test#{i}", email: "test#{i}@testers.com", screen_name: "testers#{i}"})
end

10.times do |i|
  idea = Idea.new({
    title: "Idea title#{i}",
    description: "a. A integer. Et? Est diam ridiculus mattis scelerisque, scelerisque cras, in ultricies? Ultricies sociis velit quis scelerisque sit scelerisque cum diam a odio adipiscing? Duis egestas et sociis. Nec sed porttitor, pulvinar eros integer a aenean sociis placerat? Elit aliquam. Quis quis cum sit in velit? Massa duis sociis mus porta? ",
    github: 'http://github.com/something/#{i}',
    original_desc: "a. A integer. Et? Est diam ridiculus mattis scelerisque, scelerisque cras, in ultricies? Ultricies sociis velit quis scelerisque sit scelerisque cum diam a odio adipiscing? Duis egestas et sociis. Nec sed porttitor, pulvinar eros integer a aenean sociis placerat? Elit aliquam. Quis quis cum sit in velit? Massa duis sociis mus porta? "
  })
  idea.user = User.all.shuffle.first
  idea.save
end

