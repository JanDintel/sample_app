module AuthenticateHelpers
  def user_has_account
    @user = FactoryGirl.create(:user)
  end

  def sign_in_user(user, options={})
    if options[:no_capybara]
      remember_token = User.new_remember_token
      cookies[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.encrypt(remember_token))
    else
      visit sign_in_path
      fill_in "Email",    with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
    end
  end
end
# Tell Cucumber to include the module into each World object for each Scenario
World(AuthenticateHelpers)
