DEFAULT_USER = {
  id: 0,
  username: 'Adam',
  email: 'antman@pop.com',
  password: 'bacon'
}
DEFAULT_SPACE = { id: 0, spacename: 'Pickle Place' }
DEFAULT_AVAILABILITY = {
  id: 0,
  spaceid: DEFAULT_SPACE[:id],
  date: '2019-02-27',
  formatted_date: '27/02/2019'
}
DEFAULT_START_AVAILABILITY = Date.new(2019, 04, 12)
DEFAULT_END_AVAILABILITY = Date.new(2019, 04, 15)

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
