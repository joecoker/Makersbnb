describe 'Space' do
  context '#list_spaces' do
    it 'returns a list of the spaces in the database' do
      expect(Space.list_spaces).to include DEFAULT_SPACE[:spacename]
    end
  end

  context '#create_space' do
    it 'adds the space to the database' do
      connection = PG.connect :dbname => 'makersbnb_test'
      default_user_record = connection.exec "SELECT * FROM users
        WHERE username = '#{DEFAULT_USER[:username]}';"
      owner_id = default_user_record[0]['id']
      Space.create_space(spacename: 'My House', ownerid: owner_id)
      expect(Space.list_spaces). to include 'My House'
    end
  end
end
