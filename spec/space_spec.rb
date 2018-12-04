connection = PG.connect :dbname => 'makersbnb_test'

describe 'Space' do
  context '#list_spaces' do
    it 'returns a list of the spaces in the database' do
      connection.exec "TRUNCATE TABLE spaces, users"
      connection.exec "INSERT INTO users (username) VALUES ('Adam');"
      adam_record = connection.exec "SELECT * FROM users
        WHERE username = 'Adam';"
      connection.exec "INSERT INTO spaces (owner, spacename)
        VALUES (#{adam_record[0]['id']}, 'Pickle Place');"
      expect(Space.list_spaces).to include 'Pickle Place'
    end
  end
end
