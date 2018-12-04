require 'user'
require 'pg'

describe User do
  context 'create_account' do
    it "will create an account for a user with a username and a password" do
      user = User.create_account(
        username: "Wolverine",
        email: "Xmen@gmail.com",
        password: "password"
      )
      expect(user.username).to eq("Wolverine")
   end
  end

  context '#get_user_id' do
    it 'returns the id associated with the given username' do
      id = User.get_user_id(username: DEFAULT_USER[:username])
      expect(id).to eq DEFAULT_USER[:id]
    end
  end
end
