feature 'User submits a booking request' do
  scenario 'user makes a booking request on a space and can see all requests' do
    test_login
    click_link(DEFAULT_SPACE[:spacename])
    fill_in('start_date', with: '2018-12-20')
    fill_in('end_date', with: '2018-12-23')
    click_button('Request booking')
    expect(page).to have_content("Booking request for #{DEFAULT_SPACE[:spacename]} pending")
  end
end
