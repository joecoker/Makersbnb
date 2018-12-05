feature 'raising errors' do
  scenario 'logging in with an incorrect password raises an error' do
    visit '/'
    fill_in('login_username', with: 'Adam')
    click_button('Log in')
    expect(page).to have_content "Incorrect username or password"
  end
end
