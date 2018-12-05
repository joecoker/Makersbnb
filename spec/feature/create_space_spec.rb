feature 'adding a new space' do
  scenario 'a signed up user can create a space' do
    test_login
    visit '/create-a-space'
    fill_in('space_name', with: 'Dunroamin')
    click_button('Publish my space')
    visit '/spaces'
    expect(page).to have_content 'Dunroamin'
  end
end
