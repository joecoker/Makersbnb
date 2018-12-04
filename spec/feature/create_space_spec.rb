feature 'adding a new space' do
  scenario 'a signed up user can create a space' do
    visit '/create-a-space'
    fill_in('space_name', with: 'Dunroamin')
    fill_in('username', with: DEFAULT_USER[:username])
    click_button('Publish my space')
    visit '/spaces'
    expect(page).to have_content 'Dunroamin'
  end
end
