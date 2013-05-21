require 'spec_helper'

describe "web/new.html.erb" do
	let(:post) do
		mock_model("Post").as_new_record.as_null_object
	end

	before do
		assign(:post, post)
	end

	it "renders a form to post pastebin" do
		render
		rendered.should have_selector("form",
			:method => "post",
			:action => posts_path
		) do |form|
			form.should have_selector("input", :type => 'submit')
		end
	end

	it "renders a text field for the paste name" do
		post.stub(:name => "Test Paste")
		render
		rendered.should have_selector("form") do |form|
		    form.should have_selector("input",
		      :type => "text",
		      :name => "post[name]",
		      :value => "Test Paste"
			)
		end
	end

	it "renders a text area field for the paste input" do
		post.stub(:newpaste => "Test Paste 21312321312")
		render
		rendered.should have_selector("form") do |form|
		    form.should have_selector("textarea",
		      :name => "post[newpaste]",
			)
		end
		rendered.should contain("Test Paste 21312321312")
	end

	it "renders back to home" do
	  	render
	  	rendered.should contain("Back to home page")	  	
	end
end
