feature 'login to MakersBnB' do
  scenario 'it allows a user to log into MakersBnB' do
    visit '/'
    fill_in('username', with: 'Wolverine')
    fill_in('email', with: 'Xmen@gmail.com')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).to have_content "Wolverine"
    expect(page).to have_content "Xmen@gmail.com"
    expect(page).to have_content "password"
  end
end
