require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
	before { visit root_path }
	
	it { expect(page).to have_content('This site was opened without') }
	it { expect(page).to have_title(full_title('')) }
	it { expect(page).not_to have_title('|') }
  
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
	  
	  describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link('0 following', href: following_user_path(user)) }
        it { should have_link('1 followers', href: followers_user_path(user)) }
      end
	  
    end
  
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
  
    it { expect(page).to have_content('kuzi81 at gmail') }
	it { expect(page).to have_title(full_title('Contact')) }
  end   
end