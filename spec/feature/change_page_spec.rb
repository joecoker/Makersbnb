feature 'User can click through different pages' do
  scenario 'it allows a user to navigate pages' do
    visit('/')
    fill_in('username', with: 'Wolverine')
    fill_in('password', with: 'YellowSpandex')
    fill_in('email', with: 'Xmen@gmail.com')
    click_button('Submit')
    click_link('Create a space')
    click_link('View spaces')
    click_link('Create a space')
    click_link('View spaces')

    expect(page).to have_content("Spaces")
  end
end
