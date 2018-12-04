feature 'viewing the list of all spaces' do
  scenario 'user can see all the spaces on Makersbnb' do
    visit '/spaces'
    expect(page).to have_content 'Pickle Place'
  end
end
