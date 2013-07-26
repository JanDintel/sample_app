require 'spec_helper'

describe UsersController do
  let(:user) { FactoryGirl.create(:user) }

  describe "#update" do
    before { patch :update, id: user, user: user }
    specify { expect(response).to redirect_to(sign_in_path) }
    it { should_not have_selector('div.alert.alert-notice', text: 'Need to be logged in') }
  end
end
