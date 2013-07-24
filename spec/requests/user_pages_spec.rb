require 'spec_helper'

describe "UserPages" do

  subject { page }
  let(:user) { FactoryGirl.build(:user) }
  
  describe "Signup page" do
    before { visit sign_up_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "does not create a new user" do
        expect{ click_button submit }.to_not change(User, :count)
      end
      before { click_button submit }
      it { should have_content('error') }
    end

    describe "with valid information" do
      before do
        fill_in "Name",       with: user.name
        fill_in "Email",      with: user.email
        fill_in "Password",   with: user.password
        fill_in "Confirmation", with: user.password_confirmation
      end

      it "does create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "does sign in user after create" do
        before { click_button submit }

        it { should have_link('Sign out') }
      end

      describe "does redirect to user profile page" do
        before { click_button submit }

        it { should have_title(full_title(user.name)) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "Profile page" do
    before do 
      user_profile = FactoryGirl.create(:user)
      visit user_path(user_profile)
    end

    it { should have_content(user.name) }
    it { should have_title(full_title(user.name)) }
  end
end
