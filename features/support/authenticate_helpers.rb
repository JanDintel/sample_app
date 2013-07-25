module AuthenticateHelpers
  def user_has_account
    @user = FactoryGirl.create(:user)
  end
end
# Tell Cucumber to include the module into each World object for each Scenario
World(AuthenticateHelpers)
