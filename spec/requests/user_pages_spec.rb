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
  
  
		#Edit
  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
	before { sign_in user }
    before { visit edit_user_path(user) }

    describe "page" do
      it { should have_content("Update your profile") }
      it { should have_title("Edit user") }
      it { should have_link('Change picture', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end
	
    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
	  it { should have_link('Sign out',    href: signout_path) }
      specify { expect(user.reload.name).to  eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end	
	
  end
  
end



