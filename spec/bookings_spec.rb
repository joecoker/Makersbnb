describe Booking do
  describe 'create_booking' do
    it 'creates a booking entry in the database and returns an object' do
      booking = Booking.create_booking(userid: SECOND_DEFAULT_USER[:id],
        spaceid: DEFAULT_SPACE[:id],
        start_date: "2018-12-20",
        end_date: "2018-12-23"
      )

      expect(booking.start_date).to eq("2018-12-20")
      expect(booking.end_date).to eq("2018-12-23")
      expect(booking.confirmed).to eq("f")
      expect(booking).to be_a Booking
    end
  end

  describe 'list_bookings_by_user' do
    it "lists all the bookings made by a user" do
      booking = Booking.create_booking(userid: SECOND_DEFAULT_USER[:id],
        spaceid: DEFAULT_SPACE[:id],
        start_date: "2018-12-20",
        end_date: "2018-12-23"
      )

      users_bookings = Booking.list_bookings_by_user(userid: 1)

      expect(users_bookings.first.spaceid).to eq(booking.spaceid)
      expect(users_bookings.first.start_date).to eq(booking.start_date)
      expect(users_bookings.first.end_date).to eq(booking.end_date)

    end
  end
end
