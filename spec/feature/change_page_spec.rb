feature 'User can click through different pages' do
  scenario 'it allows a user to navigate pages' do
    test_login
    click_link('Create a space')
    click_link('View spaces')
    click_link('Create a space')
    click_link('View spaces')

    expect(page).to have_content("Spaces")
  end
end
