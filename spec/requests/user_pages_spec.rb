require 'spec_helper'

describe "UserPages" do
  
  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
	
	describe "after submission" do
      before { click_button submit }

      it { should have_title('Sign up') }
      it { should have_content('error') }
    end
	
    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
	  
	  describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
	  
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
	  
    end
	
	#Name
	describe "with valid information - name blank" do
      before do
        fill_in "Name",         with: ""
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

	describe "with valid information - name too long" do
      before do
        fill_in "Name",         with: "ExampleUserAbcde"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
	
	describe "with valid information - name too short" do
      before do
        fill_in "Name",         with: "Abc"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
	
	#Email
	describe "with valid information - email wrong" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
	
	describe "with valid information - email blank" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: ""
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
	
	#Password
	describe "with valid information - password not same" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobag"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end	

	describe "with valid information - password to short" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobag"
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end	

	describe "with valid information - password blank" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: ""
        fill_in "Confirmation", with: ""
      end

      it "should create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end	
  end
end



