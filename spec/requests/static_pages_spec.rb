require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  describe "Home page" do
    let(:title) { 'Home' }
    before { visit root_path }
    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    let(:title) { 'Help' }
    before { visit help_path }
    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    let(:title) { 'About' }
    before { visit about_path }
    it { should have_content('About') }
    it { should have_title(full_title('About')) }
  end

  describe "Contact page" do
    let(:title) { 'Contact' }
    before { visit contact_path }
    it { should have_title(full_title('Contact')) }
  end
end
