feature 'booking requests page' do
  scenario 'A signed in user can view the booking requests made on their spaces' do
    visit '/'
    fill_in('login_username', with: DEFAULT_USER[:username])
    fill_in('login_password', with: DEFAULT_USER[:password])
    click_button('Submit')

    click_button('View booking request')

    
  end
end
