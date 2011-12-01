When /^I go to the home page$/ do
  visit "/"
end

When /^I go to the login page$/ do
  visit "/users/sign_in"
end

When /^I want to edit the note "([^"]*)"$/ do |title|
  note = Note.find_by_titre(title)
  note.should_not be_nil
  
  visit edit_note_path(note)
end

Then /^I should be on edit page of note "([^"]*)"$/ do |title|
  note = Note.find_by_titre(title)
  note.should_not be_nil
  
  current_path.should == edit_note_path(note)
end

Then /^I should be on the "([^"]*)" categorie page$/ do |name|
  categorie = Categorie.find_by_nom(name)
  categorie.should_not be_nil
  
  current_path.should == categorie_path(categorie)
end
