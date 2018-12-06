feature 'booking requests page' do
  scenario 'A signed in user can view the booking requests made on their spaces' do
    visit '/'
    fill_in('login_username', with: DEFAULT_USER[:username])
    fill_in('login_password', with: DEFAULT_USER[:password])
    click_button('Log in')

    click_link('Requests')

    expect(page).to have_content("#{DEFAULT_SPACE[:spacename]}")
    expect(page).to have_content("#{DEFAULT_BOOKING[:start_date]}")
    expect(page).to have_content("#{DEFAULT_BOOKING[:end_date]}")

  end
end
