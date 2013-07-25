Before { user_has_account }

Given /^a user is authorized to edit settings$/ do
  sign_in_user(@user)
end

When /^he visits his settings page$/ do
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

Then /^he should see an invalid edit error message$/ do
  show_flash_message("error")
end
