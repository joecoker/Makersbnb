feature 'viewing the list of a single spaces' do
  scenario 'user can see all the details of a single space on Makersbnb' do
    test_login
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    expect(page).to have_content DEFAULT_SPACE[:spacename]
  end

  scenario 'user can enter a comment and see it on the space page' do
    test_login
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    comment = 'I want to book this property'
    fill_in('comment_text', with: comment)
    click_button('Submit')
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    expect(page).to have_content 'I want to book this property'
  end
end
