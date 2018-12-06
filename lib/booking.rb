class Booking
  attr_reader :start_date, :end_date, :confirmed, :userid, :spaceid

  def initialize(start_date:, end_date:, userid:, spaceid:, confirmed:)
    @start_date = start_date
    @end_date = end_date
    @userid = userid
    @spaceid = spaceid
    @confirmed = confirmed
  end

  def self.create_booking(userid:, spaceid:, start_date:, end_date:)
    result = DatabaseConnection.query("INSERT
      INTO bookings (spaceid, hirerid, startdate, enddate)
      VALUES (#{spaceid}, #{userid}, '#{start_date}', '#{end_date}')
      RETURNING spaceid, hirerid, startdate, enddate, confirmed;")
    Booking.new(
      start_date: result[0]['startdate'],
      end_date: result[0]['enddate'],
      userid: result[0]['hirerid'],
      spaceid: result[0]['spaceid'],
      confirmed: result[0]['confirmed'])
  end

  def self.list_bookings_by_user(userid:)
    result = DatabaseConnection.query("
      SELECT * FROM bookings
      WHERE hirerid = #{userid};")
    result.map do |booking|
      Booking.new(start_date: booking['startdate'],
        end_date: booking['enddate'],
        userid: booking['hirerid'],
        spaceid: booking['spaceid'],
        confirmed: booking['confirmed'])
    end
  end
end
