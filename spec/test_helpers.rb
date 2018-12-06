def test_login
  visit '/'
  fill_in('login_username', with: DEFAULT_USER[:username])
  fill_in('login_password', with: DEFAULT_USER[:password])
  click_button('Log in')
end
