DEFAULT_USER = {
  id: 0,
  username: 'Adam',
  email: 'antman@pop.com',
  password: 'bacon'
}

SECOND_DEFAULT_USER = {
  id: 1,
  username: 'Ben',
  email: 'ben@test.com',
  password: 'password'
}

DEFAULT_SPACE = { id: 0, spacename: 'Pickle Place' }

DEFAULT_BOOKING ={
  id: 0,
  spaceid: DEFAULT_SPACE[:id],
  hirerid: SECOND_DEFAULT_USER[:id],
  start_date: "2018-12-20",
  end_date: "2018-12-23"
  )

}

def set_up_database
  clear_database
  populate_database
end

def clear_database
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "TRUNCATE TABLE spaces, users, comments, bookings"
end

def populate_database
  add_default_user
  add_second_default_user
  add_default_space
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

def add_second_default_user
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO users (id, username, email, password)
    VALUES (
      #{SECOND_DEFAULT_USER[:id]},
      '#{SECOND_DEFAULT_USER[:username]}',
      '#{SECOND_DEFAULT_USER[:email]}',
      '#{SECOND_DEFAULT_USER[:password]}'
    );"
end

def add_default_booking
  connection = PG.connect :dbname => 'makersbnb_test'
  connection.exec "INSERT INTO bookings (id, spaceid, hirerid, startdate, enddate)
    VALUES (
      #{SECOND_DEFAULT_USER[:id]},
      '#{SECOND_DEFAULT_USER[:username]}',
      '#{SECOND_DEFAULT_USER[:email]}',
      '#{SECOND_DEFAULT_USER[:password]}'
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
