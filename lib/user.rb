require 'pg'

class User

attr_reader :username, :email, #:password

  def initialize (username, email, userid)
    @username = username
    @email = email
    @userid = userid
    # @password = password
  end

  def self.create_account(username, email, password)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO users (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING username, email, id;")

    User.new(result[0]['username'], result[0]['email'], result[0]['id'])

  end

end
