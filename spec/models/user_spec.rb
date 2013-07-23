require 'spec_helper'

describe User do
  let(:user) { User.new(name: "Aap", email: "aap@mies.nl", 
                        password: "8letterigww", password_confirmation: "8letterigww") }

  subject { user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { user.email = " " }
    it { should_not be_valid }
  end

  describe "when email is too long" do
    before { user.email = "x" * 51 }
    it { should_not be_valid }
  end

  describe "when email is already taken" do
    before do
      user_with_same_email = user.dup
      user_with_same_email.email = user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      user.update_attributes(password: " ", password_confirmation: " ")
      user.save
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match conformation" do
    before { user.password_confirmation = "notthesame" }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before  { user.password = user.password_confirmation = "x" * 7 }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { user.save }
    let(:found_user) { User.find_by(email: user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(user.password) }
    end

    describe "with invalid password" do
      let(:found_user_with_invalid_password) { found_user.authenticate("invalidpassword") }

      # Het zou geen record van found_user moeten terug geven, vandaar should_not
      it { should_not eq found_user_with_invalid_password }
      specify { expect(found_user_with_invalid_password).to be_false } # Specify staat gelijk aan it, klinkt anders onnatuurlijk
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end

  describe "when email is mixed case" do
    let(:email_with_mixed_case) { "FooBLAaa@BrEeZeR.CoM" }

    it "should be saved downcase" do
      user.email = email_with_mixed_case
      user.save
      # Moet reload doen, anders wordt de before save niet aangeroepen in de User model
      expect(user.reload.email).to eq email_with_mixed_case.downcase      
    end
  end
end
