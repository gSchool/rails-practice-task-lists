def login(user, password = "password")
  visit signin_path
  click_on "Login"
  fill_in "Email", with: user.email
  fill_in "Password", with: password
  click_on "Login"
end