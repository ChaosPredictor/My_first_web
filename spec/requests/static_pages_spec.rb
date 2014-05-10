require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Chaos predictor'" do
      visit '/static_pages/home'
      expect(page).to have_content('This site was opened without')
    end
	
	it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("My First Web")
    end
	
	it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('|')
    end
  end
  
  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
	
	it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("My First Web | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
	
	it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("My First Web | About Us")
    end
  end 

  describe "Contact page" do

    it "should have the content 'kuzi81@gmail.com'" do
      visit '/static_pages/contact'
      expect(page).to have_content('kuzi81@gmail.com')
    end
	
	it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("| Contact")
    end
  end   
end
