
When /^I Sign out$/ do
	 page.has_content?('Sign out')
end


Then /^I should see the home page$/ do
	visit '/'
end

