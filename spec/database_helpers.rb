DEFAULT_USER = {username: 'Adam'}
DEFAULT_SPACE = {spacename: 'Pickle Place'}

def set_up_database
  clear_database
  populate_database
end

def clear_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "TRUNCATE TABLE spaces, users"
end

def populate_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO users (username)
    VALUES ('#{DEFAULT_USER[:username]}');"
  default_user_record = connection.exec "SELECT * FROM users
    WHERE username = '#{DEFAULT_USER[:username]}';"
  connection.exec "INSERT INTO spaces (owner, spacename)
    VALUES (
      #{default_user_record[0]['id']},
      '#{DEFAULT_SPACE[:spacename]}'
    );"
end
