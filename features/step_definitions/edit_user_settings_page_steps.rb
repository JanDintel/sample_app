Given /^a user has an account$/ do
  user_has_account
end

Given /^a user is signed in$/ do
  sign_in_user(@user)
end

When /^he visits the profile settings page$/ do
  visit edit_user_path(@user)
end

Then /^he should see an update form$/ do
  correct_page_with_title("Settings")
  expect(page).to have_content("Update your profile")
  expect(page).to have_button("Change my account")
end

Given /^a user edits his information$/ do
end

When /^the information he edits is invalid$/ do
  visit edit_user_path(@user)
  click_button("Change my account")
end

Then /^he should stay on the profile settings page$/ do
  expect(page).to have_content("Update your profile")
end

When /^the information he edits is valid$/ do
  visit edit_user_path(@user)
  @new_name = "New Name"
  @new_email = "new@mail.nl"
  fill_in "Name",                   with: @new_name
  fill_in "Email",                  with: @new_email
  fill_in "Password",               with: @user.password
  fill_in "Confirmation",  with: @user.password_confirmation
  click_button("Change my account")
end

Then /^he should be redirect to his updated profile$/ do
  show_flash_message('success', "Updated")
  correct_page_with_title(@new_name)
  expect(page).to have_content(@new_email)
end


