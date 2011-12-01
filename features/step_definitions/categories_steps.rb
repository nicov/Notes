Given /^the categorie "([^"]*)"$/ do |name|
  Categorie.create(
    :nom => name
  )
end
