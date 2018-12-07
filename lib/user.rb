require 'pg'

class User
  attr_reader :username, :email, :userid #:password

  def initialize(username:, email:, userid:)
    @username = username
    @email = email
    @userid = userid
    # @password = password
  end

  def self.create_account(username:, email:, password:)
    result = DatabaseConnection.query("INSERT
      INTO users (username, email, password)
      VALUES ('#{username}', '#{email}', '#{password}')
      RETURNING username, email, id;")
    User.new(username: result[0]['username'],
      email: result[0]['email'],
      userid: result[0]['id'])
  end

  def self.login(username:, password:)
    result = DatabaseConnection.query("SELECT * FROM users
      WHERE username='#{username}'
      AND password='#{password}'")
    User.new(username: result[0]['username'],
      email: result[0]['email'],
      userid: result[0]['id'])
  end

  def self.get_user_id(username:)
    query_result = DatabaseConnection.query("SELECT id FROM users
      WHERE username='#{username}'")
    query_result[0]['id'].to_i
  end
end
