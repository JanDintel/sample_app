Given /^a user visits the signin page$/ do
  visit sign_in_path
end

When /^he submits invalid signin information$/ do
  click_button "Sign in"
end

Then /^he should see an authentication error message$/ do
  show_flash_message('error')
end

Given /^the user has an account$/ do
  user_has_account
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
