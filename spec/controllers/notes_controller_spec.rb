require 'spec_helper'

describe NotesController do
  login_user

  it "redirects to the edit controller at creation" do
    note = mock_model(Note)
    categorie = mock_model(Categorie)
    Note.stub(:new) { note }
    note.stub(:save).and_return(true)
    note.stub(:categorie).and_return(categorie)
    post :create, :note => {}
    response.should redirect_to(edit_note_url(note))
  end

end
