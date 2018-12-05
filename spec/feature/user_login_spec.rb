feature 'login to MakersBnB' do
  scenario 'it allows a user to create a MakersBnB account' do
    test_login

    expect(page).to have_content "Spaces"
  end

  scenario 'users are logged in after creating an account' do
    test_login
    visit '/create-a-space'
    expect(page).to have_content 'You are logged in as: Wolverine'
  end

  scenario 'users can log in using existing account details' do
    visit '/'
    fill_in('login_username', with: DEFAULT_USER[:username])
    fill_in('login_password', with: DEFAULT_USER[:password])
    click_button('Log in')
    visit '/create-a-space'
    expect(page).to have_content 'You are logged in as: ' +
      DEFAULT_USER[:username]
  end
end
