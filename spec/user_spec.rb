require 'user'
require 'pg'

describe User do

  context 'create_account' do
    it "will create an account for a user with a username and a password" do

      user = User.create_account("Wolverine", "Xmen@gmail.com", "password")

      expect(user.username).to eq("Wolverine")

   end
  end
end
