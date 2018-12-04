DEFAULT_USER = {id: 1, username: 'Adam', email: 'antman@pop.com', password: 'bacon'}
DEFAULT_SPACE = {id: 1, spacename: 'Pickle Place'}

def set_up_database
  clear_database
  populate_database
end

def clear_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "TRUNCATE TABLE spaces, users, comments"
end

def populate_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO users (id, username, email, password)
    VALUES (#{DEFAULT_USER[:id]},
      '#{DEFAULT_USER[:username]}',
      '#{DEFAULT_USER[:email]}',
      '#{DEFAULT_USER[:password]}'
    );"
  connection.exec "INSERT INTO spaces (id, owner, spacename)
    VALUES (#{DEFAULT_SPACE[:id]},
      #{DEFAULT_USER[:id]},
      '#{DEFAULT_SPACE[:spacename]}'
    );"
end
