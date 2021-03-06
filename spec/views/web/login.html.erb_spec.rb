require 'spec_helper'

describe "web/login.html.erb" do
	let(:user) do
		mock_model("User").as_new_record.as_null_object
	end

	before do
		assign(:user, user)
	end

	it "renders a form to login" do
		render
		rendered.should have_selector("form",
			:method => "post",
			:action => users_login_attempt_path
		) do |form|
			form.should have_selector("input", :type => 'submit')
		end
	end

	it "renders a text field for the username" do
		render
		rendered.should have_selector("form") do |form|
		    form.should have_selector("input",
		      :type => "text",
		      :name => "username"
			)
		end
	end

	it "renders a password field" do
		render
		rendered.should have_selector("form") do |form|
			form.should have_selector("input",
				:type => "password",
				:name => "password"
			)
		end
	end

	it "renders back to home" do
	  	render
	  	rendered.should contain("Back to home page")	  	
	end
end