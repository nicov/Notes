Given /^I'm logged in$/ do
  step %{the user "user1" with password "password"}
  step %{I go to the login page}
  step %{I fill in "Username" with "user1"}
  step %{I fill in "Password" with "password"}
  step %{I press "Sign in"}
end

Given /^the user "([^"]*)" with password "([^"]*)"$/ do |username, password|
  user = User.create(
    :username => username,
    :password => password
  )
  user.id.should_not be_nil
end
