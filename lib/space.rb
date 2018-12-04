class Space
  def self.list_spaces
    all_space_records = DatabaseConnection.query "SELECT * FROM spaces;"
    all_space_records.map do |record|
      record['spacename']
    end
  end
end
