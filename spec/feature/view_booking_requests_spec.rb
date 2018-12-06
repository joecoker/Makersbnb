feature 'booking requests page' do
  scenario 'A signed in user can view the booking requests made on their spaces' do
    visit '/'
    fill_in('login_username', with: DEFAULT_USER[:username])
    fill_in('login_password', with: DEFAULT_USER[:password])
    click_button('Log in')

    click_link('View your spaces booking requests')

    expect(page).to have_content("#{DEFAULT_SPACE[:spacename]} has been requested from #{DEFAULT_BOOKING[:start_date]} to #{DEFAULT_BOOKING[:end_date]}")
  end
end
