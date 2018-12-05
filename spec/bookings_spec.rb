describe Booking do
  describe 'create_booking' do
    it 'creates a booking entry in the database and returns an object' do
      booking = Booking.create_booking(userid: 1,
        spaceid: 1,
        start_date: "2018-12-20",
        end_date: "2018-12-23"
      )

      expect(booking.start_date).to eq("2018-12-20")
      expect(booking.end_date).to eq("2018-12-23")
      expect(booking.confirmed).to eq(false)
      expect(booking).to be_a Booking
    end
  end
end
