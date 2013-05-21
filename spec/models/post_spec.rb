require 'spec_helper'

describe Post do
	before(:each) do
		@post = Post.new(
			:name => "Test Paste",
			:user => "ABC",
			:paste_content => "Test Paste BIN NNNN"
		)
	end

	it "is valid with valid attributes" do
		@post.should be_valid
	end

	it "is not valid without a name" do
		@post.name = nil
		@post.should_not be_valid
	end

	it "is not valid without paste content" do
		@post.paste_content = nil
		@post.should_not be_valid
	end

end