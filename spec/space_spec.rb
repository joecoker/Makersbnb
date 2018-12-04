connection = PG.connect :dbname => 'makersbnb_test'

describe 'Space' do
  context '#list_spaces' do
    it 'returns a list of the spaces in the database' do
      expect(Space.list_spaces).to include DEFAULT_SPACE[:spacename]
    end
  end
end
