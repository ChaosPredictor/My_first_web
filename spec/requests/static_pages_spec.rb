require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
	before { visit root_path }
	
	it { expect(page).to have_content('This site was opened without') }
	it { expect(page).to have_title(full_title('')) }
	it { expect(page).not_to have_title('|') }
  end
  
  describe "Help page" do
	before { visit help_path }

    it { expect(page).to have_content('Help') }
	it { expect(page).to have_title(full_title('Help')) }
  end

  describe "About page" do
	before { visit about_path }
	
    it { expect(page).to have_content('About Us') }
	it { expect(page).to have_title(full_title('About Us')) }
  end 

  describe "Contact page" do
	before { visit contact_path }	
  
    it { expect(page).to have_content('kuzi81@gmail.com') }
	it { expect(page).to have_title(full_title('Contact')) }
  end   
end