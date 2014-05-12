require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do

    it "should have the content 'Chaos predictor'" do
      visit root_path
      expect(page).to have_content('This site was opened without')
    end
	
	it "should have the title 'Home'" do
      visit root_path
      expect(page).to have_title("My First Web")
    end
	
	it "should not have a custom page title" do
      visit root_path
      expect(page).not_to have_title('|')
    end
  end
  
  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
	
	it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("My First Web | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end
	
	it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("My First Web | About Us")
    end
  end 

  describe "Contact page" do

    it "should have the content 'kuzi81@gmail.com'" do
      visit contact_path
      expect(page).to have_content('kuzi81@gmail.com')
    end
	
	it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("| Contact")
    end
  end   
end
