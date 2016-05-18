Given /^I am on a login page$/ do
	page.has_content?('Authorize JoshIdeaHub to use your account')
end

When /^I sign in with valid credentials$/ do
	page.has_content?('Authorize JoshIdeaHub to use your account')
end

Then /^I should visit home page$/ do
	visit '/'
end

