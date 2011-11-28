When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^"]*)"$/ do |string|
  page.has_content?(string).should be_true
end

Then /^I should not see "([^"]*)"$/ do |string|
  page.has_content?(string).should be_false
end
