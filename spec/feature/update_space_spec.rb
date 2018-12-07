feature 'owner updating their space' do
  scenario 'owner can cancel existing availability' do
    test_login
    click_link('Update my space')
    click_link(DEFAULT_SPACE[:spacename])
    click_button('Cancel')
    visit '/spaces'
    click_link(DEFAULT_SPACE[:spacename])
    expect(page).not_to have_content DEFAULT_AVAILABILITY[:formatted_date]
  end
end
