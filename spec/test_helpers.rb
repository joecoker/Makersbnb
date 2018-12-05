def test_login
  visit '/'
  fill_in('username', with: 'Wolverine')
  fill_in('email', with: 'Xmen@gmail.com')
  fill_in('password', with: 'password')
  click_button('Submit')
end
