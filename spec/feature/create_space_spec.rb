feature 'adding a new space' do
  scenario 'a signed up user can create a space' do
    test_login
    visit '/create-a-space'
    fill_in('space_name', with: 'Dunroamin')
    click_button('Publish my space')
    visit '/spaces'
    expect(page).to have_content 'Dunroamin'
  end

  scenario 'set the available dates when creating a space' do
    test_login
    visit '/create-a-space'
    fill_in('space_name', with: 'Spaceship')
    fill_in('start_availability', with: '01/01/2019')
    fill_in('end_availability', with: '10/01/2019')
    click_button('Publish my space')
    click_link('Spaceship')
    expect(page).to have_content '01/01/2019'
    expect(page).to have_content '05/01/2019'
    expect(page).to have_content '10/01/2019'
  end
end
