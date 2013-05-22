require 'spec_helper'

describe "web/index.html.erb" do
	let(:posts) do
		mock_model("Post").as_new_record.as_null_object
	end

	before do
		assign(:posts, posts)
	end

	it "display a login link" do
		render
		rendered.should contain("Login")
	end

	it "display a Listiing Pastes" do
		render
		rendered.should contain("Listing Pastes")
		rendered.should contain("Paste Name")
		rendered.should contain("By User")
		rendered.should contain("Actions")
	end
end