Given /^the note "([^"]*)" with content "([^"]*)"$/ do |title, content|
  note = Note.create(
    :titre => title,
    :contenu => content
  )
  note.id.should_not be_nil
end
