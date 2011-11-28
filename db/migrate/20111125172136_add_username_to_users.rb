class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username, :unique => true
    
    # Translation from the email to the username
    User.all.each do |user|
      user.update_attribute('username', user.email[/([^@]*)@[^@]*/, 1])
    end
  end
  
end
