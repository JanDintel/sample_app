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

  def right_title(title)
    click_link "#{title}" 
    expect(page).to have_title(full_title("#{title}"))
  end

  
  it "does have the right links on the layout" do
    titles = ["Help", "About", "Contact"]
    visit root_path
    
    titles.each do |t|
      right_title(t)
    end

    visit root_path
    click_link "Sign up now!"
    expect(page).to have_title(full_title("Sign up"))
    click_link "Sample App"
    expect(page).to have_title(full_title(""))
  end
end
