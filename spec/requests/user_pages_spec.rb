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
      it "does not create account" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",       with: user.name
        fill_in "Email",      with: user.email
        fill_in "Password",   with: user.password
        fill_in "Confirmation", with: user.password_confirmation
      end

      it "does create a user" do
        expect  { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "Profile page" do
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(full_title(user.name)) }
  end
end
