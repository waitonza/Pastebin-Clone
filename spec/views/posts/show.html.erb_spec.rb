require 'spec_helper'

describe "posts/show.html.erb" do
	let(:post) do
		mock_model("Post").as_new_record.as_null_object
	end

	before do
		assign(:post, post)
	end

	it "display a name" do
		post.stub(:name => "Test Paste")
		render
		rendered.should contain("Name :")
		rendered.should contain("Test Paste")
	end

	it "display a Paste Content" do
		post.stub(:paste_content => "okokokok")
		render
		rendered.should contain("Paste Content :")
		rendered.should contain("okokokok")
	end

	it "display by user" do
		post.stub(:user => "ABC")
		render
		rendered.should contain("By :")
		rendered.should contain("ABC")
	end

	it "renders back to home" do
	  	render
	  	rendered.should contain("Back to home page")	  	
	end
end
