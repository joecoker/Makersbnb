feature 'viewing the list of a single spaces' do
  scenario 'user can see all the details of a single space on Makersbnb' do
    visit '/spaces'
    click_button('View Profile')
    expect(page).to have_content 'Booking comment'
  end

  scenario 'user can enter a booking message and see it on booking page' do
    visit '/spaces'
    click_button('View Profile')
    fill_in('Comments', with: 'Request booking')
    expect(page).to have_content 'Request booking'
  end

end
