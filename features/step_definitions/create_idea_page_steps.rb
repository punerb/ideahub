
Given /^I am logged in$/ do
        visit '/'
end

Then /^I should see Details page$/ do
	visit '/ideas/new'
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
	page.should have_xpath('/html/body/div[2]')
end

When /^I click "(.*?)"$/ do |arg1|
	find_link('Create Idea').visible?
end
