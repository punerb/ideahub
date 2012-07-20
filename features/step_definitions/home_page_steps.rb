
Given /^I am not logged in$/ do
	visit '/'   
end

Given /^I am on the home page$/ do
	visit '/'   
end

Then /^I should see "(.*?)" link$/ do |arg1|
	page.should have_xpath('/html/body/div/div/div/ul[2]/li[2]/a')
end

Then /^I should see "(.*?)" button$/ do |arg1|
	page.should have_xpath('/html/body/div[2]/header/div/a')
end

When /^I click "(.*?)" link$/ do |arg1|
	page.should have_xpath('/html/body/div[2]/header/div/a')
end

Then /^I should see created ideas$/ do
	visit "/ideas"
end

Then /^I should see login page$/ do
    page.has_content?('Authorize JoshIdeaHub to use your account')
    #session = Capybara::Session.new(:selenium)
    #session.visit('https://api.twitter.com/oauth/authenticate')
    #visit('https://api.twitter.com/oauth/authenticate?oauth_token=uo1ACcxNq3GptOGxxVIVTRS2fMGN8LK1tHHkvIXHk')
    #visit('https://api.twitter.com')
end

When /^I click on "(.*?)" link$/ do |arg1|
      page.should have_link arg1
end

Then /^I should see drop down list$/ do
    page.should have_xpath('/html/body/div/div/div/ul[2]/li/ul')
end

Then /^I should see only (\d+) ideas$/ do |arg1|
    page.should have_xpath('/html/body/div[2]/div')
end
