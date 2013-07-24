require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  
  describe "Signin page" do
    let(:signin) { 'Sign in' }
    before { visit sign_in_path }

    it { should have_content('Sign in') }
    it { should have_title(full_title('Sign in')) }

    describe "with invalid information" do
      before do
        fill_in "Email", with: "invalid@invaliddomain.com"
        fill_in "Password", with: "invalidpassword"
      end

      before { click_button signin }

      it { should have_selector('div.alert.alert-error', text: 'Failed') }
    end

    describe "with valid information" do
      before do
        fill_in "Email",     with: user.email.upcase # Namelijk case-insensitive, dus is ook valid
        fill_in "Password",  with: user.password
      end
      #describe "does signin user" do

      before { click_button signin }

      it { should have_title(full_title(user.name)) }
      it { should have_selector('div.alert.alert-success', text: 'Signed in') }
      it { should have_link('Profile',      href: user_path(user)) }
      it { should have_link('Sign out',     href: sign_out_path) }
      it { should_not have_link('Sign in',  href: sign_in_path) }

      describe "followed by sign out" do

        before do
          click_link 'Home'
          click_link 'Sign out'
        end
        it { should have_link('Sign in') }
      end
    end

    describe "after visiting another page" do
      before { click_link "Home" }
      it { should_not have_selector('div.alert.alert-error', text: 'Failed to sign in') }
    end
  end
end
