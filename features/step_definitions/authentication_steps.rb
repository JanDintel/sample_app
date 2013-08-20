Given /^a user has an account is in not signed in$/ do
  user_has_account
end

Given /^a user visits the signin page$/ do
  visit sign_in_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an authentication error message$/ do
  show_flash_message('error', "Failed")
end

When /^the user submits valid signin information$/ do
  sign_in_user(@user)
end

Then /^he should see his profile page$/ do
  correct_page_with_title(@user.name)
end

Then /^he should see a signout link$/ do
  expect(page).to have_link('Sign out', href: sign_out_path)
end

And /^he should see a profile settings link$/ do
  expect(page).to have_link('Settings', href: edit_user_path(@user))
end

Then /^he should be redirected to the log in page$/ do
  show_flash_message('notice', "Need to be logged in")
  expect(page).to have_content('Sign in')
end

And /^he should see an error message that he needs to be logged in$/ do
  show_flash_message('notice', "Need to be logged in")
end

Then /^he should see the visited profile settings page$/ do
  expect(page).to have_content('Update your profile')
end

Given /^the user is unauthorized to visit the profile settings page$/ do
  @different_user = FactoryGirl.create(:user, email: "different_user@mail.nl")
  sign_in_user(@user, no_capybara: true)
end

Then /^he should be redirected to the root page$/ do
  visit edit_user_path(@different_user)
end
