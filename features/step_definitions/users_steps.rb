Given /^the user "([^"]*)" with password "([^"]*)"$/ do |username, password|
  user = User.create(
    :username => username,
    :password => password
  )
  user.id.should_not be_nil
end
