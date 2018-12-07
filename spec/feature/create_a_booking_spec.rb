feature 'User submits a booking request' do
  scenario 'user makes a booking request on a space and can see all requests' do
    test_login
    click_link(DEFAULT_SPACE[:spacename])
    fill_in('start_date', with: DEFAULT_AVAILABILITY[:date])
    fill_in('end_date', with: DEFAULT_AVAILABILITY[:date])
    click_button('Request booking')
    expect(page).to have_content("Booking request for #{DEFAULT_SPACE[:spacename]} pending")
  end

  scenario 'after the booking request is made, availability is updated' do
    test_login
    click_link(DEFAULT_SPACE[:spacename])
    fill_in('start_date', with: DEFAULT_AVAILABILITY[:date])
    fill_in('end_date', with: DEFAULT_AVAILABILITY[:date])
    click_button('Request booking')
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    expect(page).not_to have_content DEFAULT_AVAILABILITY[:formatted_date]
  end

  scenario 'further booking requests cannot be made for the same date' do
    test_login
    click_link(DEFAULT_SPACE[:spacename])
    fill_in('start_date', with: DEFAULT_AVAILABILITY[:date])
    fill_in('end_date', with: DEFAULT_AVAILABILITY[:date])
    click_button('Request booking')
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    fill_in('start_date', with: DEFAULT_AVAILABILITY[:date])
    fill_in('end_date', with: DEFAULT_AVAILABILITY[:date])
    expect {click_button('Request booking')}.to raise_error RuntimeError
  end
end
