require 'spec_helper'

describe "StaticPages" do
  def should_have_title
     have_title("Ruby on Rails Tutorial Sample App | #{title}")
  end

  def let(name)
    @lets ||= {}
    @lets[name] ||= iets
  end

  describe "Home page" do
    let(:title) { 'Home' }
    it "does have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "does have the right title" do
      visit '/static_pages/home'
      expect(page).to should_have_title
    end
  end
  describe "Help page" do
    let(:title) { 'Help' }
    it "does have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "does have right title" do
      visit '/static_pages/help'
      expect(page).to should_have_title   
    end
  end
  describe "About page" do
    let(:title) { 'About' }
    it "does have the content 'about'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "does have right title" do
      visit '/static_pages/about'
      expect(page).to should_have_title    
    end
  end
  describe "Contact page" do
    let(:title) { 'Contact' }
    it "does have right title" do
      visit '/static_pages/contact'
      expect(page).to should_have_title
    end
  end
end
