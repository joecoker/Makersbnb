describe 'Space' do
  context '#list_spaces' do
    it 'returns a list of the spaces in the database' do
      expect(Space.list_spaces).to include DEFAULT_SPACE[:spacename]
    end
  end

  context '#create_space' do
    it 'adds the space to the database' do
      connection = PG.connect :dbname => 'makersbnb_test'
      Space.create_space(
        spacename: 'My House',
        ownerid: DEFAULT_USER[:id]
      )
      expect(Space.list_spaces). to include 'My House'
    end
  end
end
