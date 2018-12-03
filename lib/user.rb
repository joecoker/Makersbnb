require 'pg'
class User

attr_reader :username, :password, :email,

  def initialize (username, password, email)
    @username = username
    @email = email
    @password = password
  end

  def create_account

  end

end
