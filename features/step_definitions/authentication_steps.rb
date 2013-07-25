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
#   fill_in "Email",    with: @user.email
#   fill_in "Password", with: @user.password
#   click_button "Sign in"
end

Then /^he should see his profile page$/ do
  correct_page_with_title(@user.name)
end

Then /^he should see a signout link$/ do
  expect(page).to have_link('Sign out', href: sign_out_path)
end
