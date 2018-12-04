class Space
  def self.list_spaces
    connection = PG.connect :dbname => 'makersbnb_test'
    all_space_records = connection.exec "SELECT * FROM spaces;"
    all_space_records.map do |record|
      record['spacename']
    end
  end
end
