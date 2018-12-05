class Space
  attr_reader :id, :spacename

  def initialize(id:, spacename:)
    @id = id
    @spacename = spacename
  end

  def self.list_spaces
    all_space_records = DatabaseConnection.query "SELECT * FROM spaces;"
    all_space_records.map do |space|
      Space.new(
        id: space['id'],
        spacename: space['spacename']
      )
    end
  end

  def self.create_space(spacename:, ownerid:)
    result = DatabaseConnection.query "INSERT
      INTO spaces (spacename, owner)
      VALUES ('#{spacename}', '#{ownerid}')
      RETURNING spacename, id;"
    Space.new(
      id: result[0]['id'],
      spacename: result[0]['spacename']
    )
  end

  def self.view_space_details(spaceid:)
    result = DatabaseConnection.query "SELECT * FROM spaces
      WHERE id='#{spaceid}';"
    { id: result[0]['id'], spacename: result[0]['spacename'] }
  end

  def self.view_availability(spaceid:)
    result = DatabaseConnection.query "SELECT * FROM availability
      WHERE space=#{spaceid};"
    result.map do |availability|
      availability['availabledate']
    end
  end
end
