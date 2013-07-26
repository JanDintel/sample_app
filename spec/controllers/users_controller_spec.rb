require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }
  let(:different_user) { FactoryGirl.create(:user, email: "different_user@mail.nl") }

  describe "unauthorized" do
    
    describe "not logged in Users#update" do
      before { patch :update, id: user, user: user }
      specify { expect(response).to redirect_to(sign_in_path) }
    end

    describe "different user in Users#update" do
      before { sign_in_user(different_user) }
      before { patch :update, id: user, user: different_user } # Passes in the different user in user hash
      specify { expect(response).to redirect_to(root_path) }
    end
  end

  def sign_in_user(user)
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
  end

end
