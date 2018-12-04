class Space
  def self.list_spaces
    all_space_records = DatabaseConnection.query "SELECT * FROM spaces;"
    all_space_records.map do |record|
      record['spacename']
    end
  end

  def self.create_space(spacename:, ownerid:)
    DatabaseConnection.query "INSERT INTO spaces (spacename, owner)
      VALUES ('#{spacename}', '#{ownerid}')"
  end
end
