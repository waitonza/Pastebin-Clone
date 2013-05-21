require 'spec_helper'

describe User do
	before(:each) do
		@user = User.new(
			"username" => "ABC",
	    	"email" => "ABC@gmail.com",
	    	"password" => "1234567",
	   		"password_confirmation" => "1234567"
		)
	end

	it "is valid with valid attributes" do
		@user.should be_valid
	end

	it "is not valid without username" do
		@user.username = nil
		@user.should_not be_valid
	end

	it "is not valid with email with invalid" do
		@user.email = 'a@@v.com'
		@user.should_not be_valid
	end

	it "is not valid without e-mail" do
		@user.email = nil
		@user.should_not be_valid
	end

	it "is not valid without password" do
		@user.password = nil
		@user.should_not be_valid
	end

	it "is not valid with password under 6 character" do
		@user.password = 'nil'
		@user.password_confirmation = 'nil'
		@user.should_not be_valid
	end

	it "is not valid with password over 20 character" do
		@user.password = 'nil1231231231231313123123123123121123123'
		@user.password_confirmation = 'nil1231231231231313123123123123121123123'
		@user.should_not be_valid
	end

	it "is not valid with password is not match" do
		@user.password = 'nil12345'
		@user.password_confirmation = 'nill2345'
		@user.should_not be_valid
	end

end
