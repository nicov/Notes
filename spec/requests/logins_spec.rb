require 'spec_helper'

describe "Logins" do
  describe "GET /logins" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get logins_path
      response.status.should be(200)
    end
  end
  
  it "redirects to login page when requesting a page" do
    note = Note.create(
      :titre => "rspec note",
      :contenu => "This is a rspec note"
    )
    get note_path(note)
    response.should_redirect_to()
  end
end
