DEFAULT_USER = {
  id: 1,
  username: 'Adam',
  email: 'antman@pop.com',
  password: 'bacon'
}
DEFAULT_SPACE = { id: 1, spacename: 'Pickle Place' }
DEFAULT_AVAILABILITY = {
  id: 1,
  spaceid: DEFAULT_SPACE[:id],
  date: '2019-02-27'
}

def set_up_database
  clear_database
  populate_database
end

def clear_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "TRUNCATE TABLE spaces, users, comments, availability"
end

def populate_database
  add_default_user
  add_default_space
  add_default_availability
end

def add_default_user
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO users (id, username, email, password)
    VALUES (
      #{DEFAULT_USER[:id]},
      '#{DEFAULT_USER[:username]}',
      '#{DEFAULT_USER[:email]}',
      '#{DEFAULT_USER[:password]}'
    );"
end

def add_default_space
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO spaces (id, owner, spacename)
    VALUES (
      #{DEFAULT_SPACE[:id]},
      #{DEFAULT_USER[:id]},
      '#{DEFAULT_SPACE[:spacename]}'
    );"
end

def add_default_availability
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO availability (id, space, availabledate)
    VALUES (
      #{DEFAULT_AVAILABILITY[:id]},
      #{DEFAULT_AVAILABILITY[:spaceid]},
      '#{DEFAULT_AVAILABILITY[:date]}'
    );"
end
