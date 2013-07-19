require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "does have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "does have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App | Home')
    end
  end
  describe "Help page" do
    it "does have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "does have right title" do
      visit '/static_pages/help'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App | Help')    
    end
  end
  describe "About page" do
    it "does have the content 'about'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end

    it "does have right title" do
      visit '/static_pages/about'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App | About')    
    end
  end
end
