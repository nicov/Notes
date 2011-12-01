Given /^the note "([^"]*)" with content "([^"]*)"$/ do |title, content|
  note = Note.create(
    :titre => title,
    :contenu => content
  )
  note.id.should_not be_nil
end

Given /^the note "([^"]*)" with content "([^"]*)" and categorie "([^"]*)"$/ do |title, content, categorie_name|
  categorie = Categorie.find_by_nom(categorie_name)
  categorie.should_not be_nil
  note = Note.create(
    :titre => title,
    :contenu => content,
    :categorie_id => categorie.id
  )
end
