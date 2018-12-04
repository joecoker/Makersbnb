feature 'login to MakersBnB' do
  scenario 'it allows a user to create a MakersBnB account' do
    visit '/'
    fill_in('username', with: 'Wolverine')
    fill_in('email', with: 'Xmen@gmail.com')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).to have_content "Spaces"
  end

  scenario 'users are logged in after creating an account' do
    visit '/'
    fill_in('username', with: 'Gambit')
    fill_in('email', with: 'lesXmen@gmail.com')
    fill_in('password', with: 'mot-de-passe')
    click_button('Submit')

    visit '/create-a-space'
    expect(page).to have_content 'You are logged in as: Gambit'
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
