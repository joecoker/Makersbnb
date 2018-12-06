describe Owner do
  describe 'list_booking_requests_by_owner' do
    it "returns a list of bookings for each space an owner has" do
      Booking.create_booking(userid: SECOND_DEFAULT_USER[:id],
      spaceid: DEFAULT_SPACE[:id],
      start_date: "2018-12-22",
      end_date: "2018-12-29"
      )

      list_of_booking_requests = Owner.list_booking_requests_by_owner(ownerid: DEFAULT_USER[:id])

      expect(list_of_booking_requests[0]['hirerid']).to eq(SECOND_DEFAULT_USER[:id].to_s)
      expect(list_of_booking_requests[0]['spaceid']).to eq(DEFAULT_SPACE[:id].to_s)
    end
  end
end
