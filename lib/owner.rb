class Owner
  def self.list_booking_requests_by_owner(ownerid:)
    DatabaseConnection.query("
      SELECT spaces.spacename, bookings.*
      FROM spaces
      INNER JOIN bookings
      ON spaces.id = bookings.spaceid
      WHERE spaces.owner = #{ownerid};")
  end
end
